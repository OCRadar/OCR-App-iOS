import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]),
                               startPoint: .top,
                               endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.9)
                    .saturation(0.75)
                
                VStack(spacing: 20) {
                    Text("OCRadar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 100)
                        
                    Image("OCR-Circle")
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
                    
                    NavigationLink(destination: CameraView()) {
                        Text("Demo")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple.opacity(0.75))
                            .cornerRadius(100)
                            .shadow(color: Color.purple, radius: 15)
                            .saturation(0.75)
                            .padding(.top, -50)
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 70)
                    
                    

                }
                .padding(.horizontal, 20)
            }
            
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
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            Text(description)
                .font(.body)
                .foregroundColor(.black.opacity(0.7))
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.5))
        .cornerRadius(18*2)
        
        //.shadow(color: Color.white, radius: 15)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
