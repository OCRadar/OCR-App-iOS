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
            VStack {
                Image(systemName: "camera")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Filler base app, more to come soon")
            }
            .tabItem {
                Label("Camera", systemImage: "camera")
            }
            
            VStack {
                Image(systemName: "house")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Filler base app, more to come soon")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            VStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Filler base app, more to come soon")
            }
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
