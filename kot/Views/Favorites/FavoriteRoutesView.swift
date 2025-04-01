import SwiftUI

struct FavoriteRoutesView: View {
    @State var favoriteRoutes = []
    let emptyFavoriteRoutesErrorText: String = "Добавьте избранные\n маршруты на карте"
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Избранные маршруты")
                .font(.title.weight(.medium))
            ScrollView() {
                if favoriteRoutes.isEmpty {
                    ErrorPlain(errorText: emptyFavoriteRoutesErrorText)
                }
            }
        }
        
    }
}
