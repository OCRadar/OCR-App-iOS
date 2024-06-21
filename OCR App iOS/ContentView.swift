import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    enum Tab {
        case camera
        case home
        case settings
    }

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                CameraView()
                    .tag(Tab.camera)
                
                HomeView()
                    .tag(Tab.home)
                
                SettingsView()
                    .tag(Tab.settings)
            }
            .edgesIgnoringSafeArea(.top)
            
            Spacer()
            
            HStack {
                Spacer()
                
                TabBarButton(systemImage: "camera", tab: .camera, selectedTab: $selectedTab)
                Spacer()
                
                TabBarButton(systemImage: "house", tab: .home, selectedTab: $selectedTab)
                Spacer()
                
                TabBarButton(systemImage: "gear", tab: .settings, selectedTab: $selectedTab)
                Spacer()
            }
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.gray.opacity(0.2))
                    .frame(height: 70)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
            )
            .padding(.bottom, 20)
            .background(Color.black.edgesIgnoringSafeArea(.bottom))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarButton: View {
    let systemImage: String
    let tab: ContentView.Tab
    @Binding var selectedTab: ContentView.Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: systemImage)
                .font(.system(size: 24))
                .foregroundColor(selectedTab == tab ? .blue : Color.white.opacity(0.5))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
