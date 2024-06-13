import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]),
                           startPoint: .top,
                           endPoint: .center)
                .edgesIgnoringSafeArea(.all)
            
            // Content
            VStack(spacing: 20) {
                // Settings Title
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Settings Options
                VStack(spacing: 15) {
                    SettingOptionView(icon: "bell", title: "Notifications")
                    SettingOptionView(icon: "lock", title: "Privacy")
                    SettingOptionView(icon: "info.circle", title: "About")
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
                
                Spacer()
            }
            .padding()
        }
    }
}

struct SettingOptionView: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
            
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(10)
//        .overlay(
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(
//                    LinearGradient(
//                        gradient: Gradient(stops: [
//                            .init(color: Color.white.opacity(0.25), location: 0),
//                            .init(color: Color.white.opacity(0.0), location: 0.25),
//                            .init(color: Color.white.opacity(0.0), location: 0.75),
//                            .init(color: Color.white.opacity(0.15), location: 1)
//                        ]),
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    ),
//                    lineWidth: 2
//                )
//        )
    }
}

#Preview {
    SettingsView()
}
