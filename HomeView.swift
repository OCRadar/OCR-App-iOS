import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]),
                           startPoint: .top,
                           endPoint: .center)
                .edgesIgnoringSafeArea(.all)
            
            // Content
            VStack(spacing: 20) {
                // Top Image
                
                // Welcome Text
                Text("OCRadar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Quick Actions Section
                VStack(spacing: 15) {
                    Text("Quick Actions")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: "camera")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            Text("Camera")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        VStack {
                            Image(systemName: "house")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            Text("Home")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        VStack {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            Text("Settings")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(
//                            LinearGradient(
//                                gradient: Gradient(stops: [
//                                    .init(color: Color.white.opacity(0.50), location: 0),
//                                    .init(color: Color.white.opacity(0.0), location: 0.25),
//                                    .init(color: Color.white.opacity(0.0), location: 0.75),
//                                    .init(color: Color.white.opacity(0.35), location: 1)
//                                ]),
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            ),
//                            lineWidth: 2
//                        )
//                )
//                .shadow(radius: 10)
                
                Spacer()
                
                // Call to Action Button
                Button(action: {
                    // Action for the button
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(stops: [
                                            .init(color: Color.white.opacity(0.50), location: 0),
                                            .init(color: Color.white.opacity(0.0), location: 0.25),
                                            .init(color: Color.white.opacity(0.0), location: 0.75),
                                            .init(color: Color.white.opacity(0.35), location: 1)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 2
                                )
                        )
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00ff00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000ff) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
