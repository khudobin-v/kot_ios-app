import SwiftUI

struct FavoriteItem: View {
    let name: String
    let iconName: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 24))
            Text(name)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
} 