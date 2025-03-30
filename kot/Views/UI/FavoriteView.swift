import SwiftUI

struct FavoriteView: View {
    @State var name: String
    @State var iconName: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: iconName)
                .fontWeight(.bold)
                .font(.system(size: 28))
                .foregroundColor(.green)
                .frame(width: 60, height: 60)
                .background(Color(.green).opacity(0.3))
                .clipShape(Circle())
            Text(name)
                .font(.callout)
                .fontWeight(.medium)
        }
    }
}
