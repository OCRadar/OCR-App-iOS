//
//  ContentView.swift
//  OCR App iOS
//
//  Created by Aniketh Bandlamudi on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Filler base app, more to come soon")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
