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
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 70, height: 70)
                    .shadow(radius: 5)
                
                Image(systemName: systemImage)
                    .font(.system(size: 24)) // Adjust the size of the icon
                    .foregroundColor(selectedTab == tab ? .blue : .gray)
            }
        }
        .padding(.bottom, 20) // This gives the floating effect
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
