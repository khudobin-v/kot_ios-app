import SwiftUI

struct CircleButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .background(Circle().fill(.thickMaterial))
            .foregroundColor(.blue)
            .clipShape(Circle())
    }
}

extension View {
    func circleButtonStyle() -> some View {
        self.modifier(CircleButtonStyle())
    }
}
