//
//  ContentView.swift
//  OCR App iOS
//
//  Created by Aniketh Bandlamudi on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
