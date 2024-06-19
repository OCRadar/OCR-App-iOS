////  BackendLink.swift
////  OCR App iOS
////
////  Created by Aniketh Bandlamudi on 6/19/24.
////
//
//import Foundation
//import SwiftUI
//import UIKit
//
//struct CameraView: UIViewControllerRepresentable {
//    @Binding var image: UIImage?
//    @Binding var analysisResult: String?
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        var parent: CameraView
//
//        init(parent: CameraView) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.image = uiImage
//                parent.uploadImage(image: uiImage)
//            }
//            picker.dismiss(animated: true)
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.sourceType = .camera
//        picker.cameraDevice = .rear
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//
//    func uploadImage(image: UIImage) {
//        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
//
//        let url = URL(string: "http://your-backend-url/analyze")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let base64Image = imageData.base64EncodedString()
//        let json: [String: Any] = ["image": base64Image]
//
//        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else { return }
//
//        URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
//            guard let data = data, error == nil else { return }
//            if let analysisResult = try? JSONDecoder().decode(String.self, from: data) {
//                DispatchQueue.main.async {
//                    self.analysisResult = analysisResult
//                }
//            }
//        }.resume()
//    }
//}
