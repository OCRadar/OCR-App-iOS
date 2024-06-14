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
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Swipable Card Stack
                    TabView {
                        ForEach(0..<10, id: \.self) { index in
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
            return "Introduction"
        case 1:
            return "Key Features"
        case 2:
            return "Version 1.0"
        case 3:
            return "User Guide"
        case 4:
            return "User Feedback"
        case 5:
            return "Premium Features"
        case 6:
            return "Future Updates"
        case 7:
            return "Tips and Tricks"
        case 8:
            return "Community"
        case 9:
            return "Thank You"
        default:
            return ""
        }
    }
    
    // Function to provide hardcoded descriptions for each card
    private func cardDescription(for index: Int) -> String {
        switch index {
        case 0:
            return "This is an introduction to OCRadar."
        case 1:
            return "Discover the key features of OCRadar."
        case 2:
            return "Explore the features of version 1.0."
        case 3:
            return "Learn how to use OCRadar effectively."
        case 4:
            return "See what users are saying about OCRadar."
        case 5:
            return "Explore our premium features."
        case 6:
            return "Find out what's coming in future updates."
        case 7:
            return "Discover tips and tricks for using OCRadar."
        case 8:
            return "Join our community and share your feedback."
        case 9:
            return "Thank you for choosing OCRadar!"
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
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
