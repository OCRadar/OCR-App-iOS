//
//  GlassModifier.swift
//  OCR App iOS
//
//  Created by Aniketh Bandlamudi on 6/7/24.
//

import Foundation
import SwiftUI

struct GlassModifier: ViewModifier {
   func body(content: Content) -> some View {
        content
            .padding()
            .background(BlurView(style: .systemThinMaterial))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.7), lineWidth: 1)
            )
            .shadow(radius: 10)
    }
}

extension View {
    func glassEffect() -> some View {
        self.modifier(GlassModifier())
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
