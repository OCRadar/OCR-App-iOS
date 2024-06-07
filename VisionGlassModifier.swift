//
//  VisionGlassModifier.swift
//  OCR App iOS
//
//  Created by Aniketh Bandlamudi on 6/7/24.
//

import Foundation
import SwiftUI

struct VisionGlassModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color.white.opacity(0.1), location: 0),
                            .init(color: Color.white.opacity(0.15), location: 0.15),
                            .init(color: Color.white.opacity(1), location: 0.5),
                            .init(color: Color.white.opacity(0.15), location: 0.85),
                            .init(color: Color.white.opacity(0.1), location: 1)
                        ]), startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 1
                    )
            )
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

extension View {
    func visionGlassEffect() -> some View {
        self.modifier(VisionGlassModifier())
    }
}
