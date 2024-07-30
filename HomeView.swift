import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black, Color.black]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("OCRadar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 100)
                        
                    Image("ocrnew")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.bottom, -50)
                    
                    Spacer()
                    
                    TabView {
                        ForEach(0..<5, id: \.self) { index in
                            CardView(title: cardTitle(for: index), description: cardDescription(for: index))
                                .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 350)
                    
                    Spacer()
                    
//                    NavigationLink(destination: CameraView()) {
//                        Text("Demo")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.purple.opacity(0.75))
//                            .cornerRadius(100)
//                            .shadow(color: Color.purple, radius: 15)
//                            .saturation(0.75)
//                            .padding(.top, -50)
//
//                    }
                    .padding(.horizontal)
                    .padding(.bottom, 70)
                }
                .padding(.horizontal, 20)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
    
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
    
    private func cardDescription(for index: Int) -> String {
        switch index {
        case 0:
            return "Welcome to the Developer Alpha of OCRadar. We strive to facilitate the detection of Oral Cancer in our users. Please note that this is a pre-release internal alpha version. Features and results are NOT finalized."
        case 1:
            return "Discover the key features of OCRadar. The Camera tab is the heart of the app. It is home to the picture taking, and AI processing features. After a scan, you will be given a result."
        case 2:
            return "This version contains the foundations of OCRadar. New features will be pushed after the public release of the app."
        case 3:
            return "OCRadar features 3 main tabs. The home tab shows basic information. The settings tab houses all app settings, account data, and results. The camera tab is where you will take/upload pictures and receive a result."
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
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text(description)
                .font(.body)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.3))
        .cornerRadius(36)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
