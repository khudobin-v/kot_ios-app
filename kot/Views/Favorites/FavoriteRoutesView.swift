import SwiftUI

struct FavoriteRoutesView: View {
    @State var favoriteRoutes = []
    let emptyFavoriteRoutesErrorText: String = Strings.SearchModal.FavoritesGroup.Routes.emptyDescription
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(Strings.SearchModal.FavoritesGroup.Routes.favorite)
                .font(.title.weight(.medium))
            ScrollView() {
                if favoriteRoutes.isEmpty {
                    ErrorPlain(errorText: emptyFavoriteRoutesErrorText)
                }
            }
        }
        
    }
}
