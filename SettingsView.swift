import SwiftUI

struct SettingsView: View {
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
                    
                    
                    
                    
                    VStack(spacing: 15) {
                        NavigationLink(destination: NotificationsView()) {
                            SettingOptionView(icon: "bell", title: "    Notifications")
                        }
                        NavigationLink(destination: PrivacyView()) {
                            SettingOptionView(icon: "lock", title: "    Privacy")
                        }
                        NavigationLink(destination: AboutView()) {
                            SettingOptionView(icon: "info.circle", title: "    About")
                        }
                        NavigationLink(destination: AccountView()) {
                            SettingOptionView(icon: "person", title: "    Account")
                        }
                        NavigationLink(destination: AppearanceView()) {
                            SettingOptionView(icon: "paintbrush", title: "    Appearance")
                        }
                        NavigationLink(destination: HelpView()) {
                            SettingOptionView(icon: "questionmark.circle", title: "    Help & Support")
                        }
                        
                    }
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(18*2)
                    
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
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.black)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding()
        .padding(.horizontal)
        .background(Color.white.opacity(0.5))
        .cornerRadius(100)
        //.shadow(color: .white, radius: 200, x: 0, y: 0)
    }
}


struct NotificationsView: View {
    @State private var enableNotifications = true
    @State private var notificationInterval = 15
    
    var body: some View {
        Form {
            Section(header: Text("Notification Settings")) {
                Toggle(isOn: $enableNotifications) {
                    Text("Enable Notifications")
                }
                
                Stepper(value: $notificationInterval, in: 5...60, step: 5) {
                    Text("Notification Interval: \(notificationInterval) minutes")
                }
            }
        }
        .navigationBarTitle("Notifications")
    }
}


struct PrivacyView: View {
    @State private var enableAnalytics = true
    @State private var enableDataCollection = false
    
    var body: some View {
        Form {
            Section(header: Text("Privacy Settings")) {
                Toggle(isOn: $enableAnalytics) {
                    Text("Enable Analytics")
                }
                
                Toggle(isOn: $enableDataCollection) {
                    Text("Enable Data Collection")
                }
            }
        }
        .navigationBarTitle("Privacy")
    }
}


struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("About This App")
                .font(.title)
            
            Text("Version 1.0")
                .foregroundColor(.gray)
            
            Text("This version contains the foundations of OCRadar. New features will be pushed after the public release of the app.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .navigationBarTitle("About")
    }
}


struct AccountView: View {
    @State private var userName = "Aniketh Bandlamudi"
    @State private var email = "anikethdb1@gmail.com"
    
    var body: some View {
        Form {
            Section(header: Text("Account Information")) {
                TextField("Username", text: $userName)
                    .disableAutocorrection(true)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
            }
        }
        .navigationBarTitle("Account")
    }
}


struct AppearanceView: View {
    @State private var darkModeEnabled = true
    @State private var fontSize = 16
    
    var body: some View {
        Form {
            Section(header: Text("Appearance Settings")) {
                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark Mode")
                }
                
                Stepper(value: $fontSize, in: 12...24, step: 2) {
                    Text("Font Size: \(fontSize)")
                }
            }
        }
        .navigationBarTitle("Appearance")
    }
}


struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Help & Support")
                .font(.title)
            
            Text("Contact Us:")
                .foregroundColor(.gray)
            
            Button(action: {
                
            }) {
                Text("support@ocradar.com")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .navigationBarTitle("Help & Support")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
