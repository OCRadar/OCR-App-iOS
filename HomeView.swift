import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]),
                               startPoint: .top,
                               endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                
                // Content
                VStack(spacing: 20) {
                    // Top Image (you can add an image here if needed)
                    
                    // Welcome Text
                    Text("OCRadar")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                
                    
                    Spacer()
                    
                    // Swipable Card Stack
                    TabView {
                        ForEach(0..<5, id: \.self) { index in
                            CardView(title: cardTitle(for: index), description: cardDescription(for: index))
                                .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
                    
                    Spacer()
                    
                    // Call to Action Button
                    NavigationLink(destination: CameraView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(100)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
    }
    
    // Function to provide hardcoded titles for each card
    private func cardTitle(for index: Int) -> String {
        switch index {
        case 0:
            return "Welcome"
        case 1:
            return "Key Features"
        case 2:
            return "Version 1.0"
        case 3:
            return "User Guide"
        case 4:
            return "Feedback"
            
        default:
            return ""
        }
    }
    
    // Function to provide hardcoded descriptions for each card
    private func cardDescription(for index: Int) -> String {
        switch index {
        case 0:
            return "Welcome to the Developer Alpha of OCRadar. We strive to facilitate the detection of Oral Cancer in our users."
        case 1:
            return "Discover the key features of OCRadar. The Camera tab is the heart of the app. It is home to the picture taking, and AI processing features. After a scan, you will be given a result."
        case 2:
            return "This version contains the foundations of OCRadar. New features will be pushed after the public release of the app."
        case 3:
            return "Learn how to use OCRadar effectively."
        case 4:
            return "Please share feedback and report issues. This is a crucial step in ensuring the function of the app, and accurate results for our users."

        default:
            return ""
        }
    }
}

struct CardView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(Color.gray.opacity(0.2)) // Translucent background
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
