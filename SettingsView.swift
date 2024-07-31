import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black, Color.black]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    VStack(spacing: 15) {
                        NavigationLink(destination: AboutView()) {
                            SettingOptionView(icon: "info.circle", title: "    About")
                        }
                        NavigationLink(destination: HelpView()) {
                            SettingOptionView(icon: "questionmark.circle", title: "    Help & Support")
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(36)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Settings")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .center)
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
        .padding(.horizontal)
        .background(Color.black.opacity(0.2))
        .cornerRadius(100)
    }
}

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("About This App")
                .font(.title)
            
            Text("Version 1.0")
                .foregroundColor(.gray)
            
            Text("Revolutionizing cancer detection with AI & ML")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .navigationBarTitle("About")
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
                Text("ocradar.contact@gmail.com")
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
