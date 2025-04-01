import SwiftUI

struct FavoriteStopsView: View {
    @State var favoriteStops = []
    let emptyFavoriteTransportErrorText: String = Strings.SearchModal.FavoritesGroup.Stops.emptyDescription
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(Strings.SearchModal.FavoritesGroup.Stops.favorite)
                .font(.title.weight(.medium))
            ScrollView() {
                if favoriteStops.isEmpty {
                    ErrorPlain(errorText: emptyFavoriteTransportErrorText)
                }
            }
        }
        
    }
}
