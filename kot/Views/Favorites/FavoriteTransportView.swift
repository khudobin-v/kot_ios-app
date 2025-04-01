import SwiftUI

struct FavoriteTransportView: View {
    @State var favoriteTransport = []
    let emptyFavoriteTransportErrorText: String = Strings.SearchModal.FavoritesGroup.Transport.emptyDescription
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(Strings.SearchModal.FavoritesGroup.Transport.favorite)
                .font(.title.weight(.medium))
            ScrollView() {
                if favoriteTransport.isEmpty {
                    ErrorPlain(errorText: emptyFavoriteTransportErrorText)
                }
            }
        }
    }
}
