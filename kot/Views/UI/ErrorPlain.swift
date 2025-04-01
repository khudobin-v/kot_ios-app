import SwiftUI

struct ErrorPlain: View {
    @State var errorText: String = "Произошла ошибка..."
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "exclamationmark.triangle")
                .font(.title)
            Text(errorText)
        }
            .font(.callout.weight(.medium))
            .opacity(0.5)
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
    }
}
