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
                        CardView(title: "Card Title \(index + 1)", description: "This is a description for card number \(index + 1).")
                            .padding(.horizontal)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 300)
                
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
                }
                .padding(.horizontal)
            }
            .padding()
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
