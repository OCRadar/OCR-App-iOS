import SwiftUI
import UIKit

struct CameraView: View {
    @Binding var image: UIImage?
    @Binding var results: String
    @State private var showingImagePicker = false
    @State private var isLoading = false
    @State private var debugInfo = ""

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set background color to black

            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("No image selected")
                        .foregroundColor(.white)
                }

                Button("Take Photo") {
                    self.showingImagePicker = true
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                }

                Text(results)
                    .foregroundColor(.white)
                    .padding()

                Text(debugInfo)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding()
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: processImage) {
                ImagePicker(image: self.$image)
            }
        }
    }

    func processImage() {
        guard let image = image else {
            debugInfo = "No image selected"
            return
        }
        isLoading = true
        debugInfo = "Processing image..."
        sendImageToAzure(image: image)
    }

    func sendImageToAzure(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            DispatchQueue.main.async {
                self.debugInfo = "Failed to convert image to data"
                self.isLoading = false
            }
            return
        }

        let urlString = "\(Config.endpoint)customvision/v3.0/Prediction/\(Config.projectID)/classify/iterations/\(Config.publishedModelName)/image"
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.debugInfo = "Invalid URL"
                self.isLoading = false
            }
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(Config.predictionKey, forHTTPHeaderField: "Prediction-Key")
        request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        request.httpBody = imageData

        DispatchQueue.main.async {
            self.debugInfo = "Sending request to Azure..."
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.debugInfo = "Network error: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self.debugInfo = "Invalid response"
                    return
                }
                
                self.debugInfo = "Response status code: \(httpResponse.statusCode)"
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    self.debugInfo = "Server error: \(httpResponse.statusCode). URL: \(url.absoluteString)"
                    return
                }

                guard let data = data else {
                    self.debugInfo = "No data received"
                    return
                }

                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let predictions = json["predictions"] as? [[String: Any]] {
                            self.results = predictions.map { prediction -> String in
                                let tagName = prediction["tagName"] as? String ?? "Unknown"
                                let probability = prediction["probability"] as? Double ?? 0.0
                                return "\(tagName): \(String(format: "%.2f", probability * 100))%"
                            }.joined(separator: "\n")
                            self.debugInfo = "Results parsed successfully"
                        } else {
                            self.debugInfo = "Unable to parse prediction result"
                        }
                    } else {
                        self.debugInfo = "Invalid JSON structure"
                    }
                } catch {
                    self.debugInfo = "JSON parsing error: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
