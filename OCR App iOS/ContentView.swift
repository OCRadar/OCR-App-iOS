//
//  ContentView.swift
//  OCR App iOS
//
//  Created by Aniketh Bandlamudi on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    enum Tab {
        case camera
        case home
        case settings
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
                .tag(Tab.camera)
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
}

#Preview {
    ContentView()
}

// code below is a not fully working nor complete implementation of a better tab bar, is being worked on

//
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var selectedTab: Tab = .home
//
//    enum Tab {
//        case camera
//        case home
//        case settings
//    }
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            CameraView()
//                .tabItem {
//                    Label("Camera", systemImage: "camera")
//                }
//                .tag(Tab.camera)
//            
//            HomeView()
//                .tabItem {
//                    // Replace default "Home" label and icon with a custom image
//                    Image("custom_home_icon") // Replace "custom_home_icon" with your image name
//                        .resizable()
//                        .renderingMode(.template)
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 22, height: 22) // Adjust size as needed
//                }
//                .tag(Tab.home)
//            
//            SettingsView()
//                .tabItem {
//                    Label("Settings", systemImage: "gear")
//                }
//                .tag(Tab.settings)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
