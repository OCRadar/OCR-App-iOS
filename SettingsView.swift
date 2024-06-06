//
//  SettingsView.swift
//  OCR App iOS
//
//  Created by Aniketh Bandlamudi on 6/6/24.
//

import Foundation

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled: Bool = true
    @State private var selectedTheme: String = "Light"
    @State private var volumeLevel: Double = 50.0

    let themes = ["Light", "Dark", "System"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable Notifications")
                    }
                    
                    Picker(selection: $selectedTheme, label: Text("Theme")) {
                        ForEach(themes, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section(header: Text("Sound")) {
                    Slider(value: $volumeLevel, in: 0...100, step: 1) {
                        Text("Volume")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
