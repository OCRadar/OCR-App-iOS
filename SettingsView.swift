import SwiftUI

struct SettingsView: View {
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
                    // Settings Title
//                    Text("Settings")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
                    
                    // Settings Options
                    VStack(spacing: 15) {
                        NavigationLink(destination: NotificationsView()) {
                            SettingOptionView(icon: "bell", title: "Notifications")
                        }
                        NavigationLink(destination: PrivacyView()) {
                            SettingOptionView(icon: "lock", title: "Privacy")
                        }
                        NavigationLink(destination: AboutView()) {
                            SettingOptionView(icon: "info.circle", title: "About")
                        }
                        // Add more settings options as needed
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(30)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Settings")
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
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
    }
}

// Example sub-views for each setting

struct NotificationsView: View {
    var body: some View {
        Text("Notifications Settings Placeholder")
            .navigationBarTitle("Notifications")
    }
}

struct PrivacyView: View {
    var body: some View {
        Text("Privacy Settings Placeholder")
            .navigationBarTitle("Privacy")
    }
}

struct AboutView: View {
    var body: some View {
        Text("About Settings Placeholder")
            .navigationBarTitle("About")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
