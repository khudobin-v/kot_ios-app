import SwiftUI

struct ResetRotationButton: View {
    let mapRotation: Double
    let onReset: () -> Void
    
    var body: some View {
            Button(action: onReset) {
                Image(systemName: "safari")
                    .rotationEffect(.degrees(-45))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.tint, .thickMaterial.opacity(0))
                    .font(.system(size: 34))
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(.thickMaterial))
                    .foregroundColor(.blue)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(mapRotation > 180 ? mapRotation - 360 : mapRotation))
                    .opacity((abs(mapRotation) > 5) ? 1 : 0)
            }
    }
}
