import SwiftUI

struct AnimatingMeshView: View {
    let referenceDate: Date
    
    var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSince(referenceDate)
            
            MeshGradient(width: 5, height: 4, points: [
                [0, 0], [0.25, 0], [0.5, 0], [0.75, 0], [1, 0],
                
                [0, 0.333],
                [value(in: 0.0...0.2, offset: 0.1, timeScale: 0.2, t: t),   value(in: 0.25...0.4, offset: 0.1, timeScale: 0.3, t: t)],
                [value(in: 0.4...0.6, offset: 0.05, timeScale: 0.3, t: t),  value(in: 0.2...0.4, offset: 0.15, timeScale: 0.3, t: t)],
                [value(in: 0.8...1.0, offset: 0.1, timeScale: 0.3, t: t),   value(in: 0.15...0.3, offset: 0.1, timeScale: 0.4, t: t)],
                [1, 0.333],
                
                [0, 0.667],
                [value(in: 0.2...0.3, offset: 0.05, timeScale: 0.3, t: t),  value(in: 0.6...0.95, offset: 0.1, timeScale: 0.4, t: t)],
                [value(in: 0.4...0.6, offset: 0.07, timeScale: 0.25, t: t),  value(in: 0.6...0.9, offset: 0.1, timeScale: 0.3, t: t)],
                [value(in: 0.8...0.9, offset: 0.06, timeScale: 0.3, t: t),  value(in: 0.6...0.8, offset: 0.12, timeScale: 0.3, t: t)],
                [1, 0.667],
                
                [0, 1], [0.25, 1], [0.5, 1], [0.75, 1], [1, 1],
            ], colors: [
                .gray.opacity(0.2), .gray.opacity(0.2), .gray.opacity(0.2), .gray.opacity(0.2), .gray.opacity(0.2),
                .gray.opacity(0.2), .gray.opacity(0.2), .gray.opacity(0.2), .gray.opacity(0.2), .gray.opacity(0.2),
                
                .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.5),
                .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.5)
            ])
            .ignoresSafeArea()
        }
    }
    
    func value(in range: ClosedRange<Float>, offset: Float, timeScale: Float, t: TimeInterval) -> Float {
        let amp = (range.upperBound - range.lowerBound) * 0.5
        let midPoint = (range.lowerBound + range.upperBound) * 0.5
        return midPoint + amp * sin(timeScale * Float(t) + offset)
    }
}

#Preview {
    AnimatingMeshView(referenceDate: .now)
}
