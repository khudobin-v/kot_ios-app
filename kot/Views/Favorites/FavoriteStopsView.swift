import SwiftUI

struct FavoriteStopsView: View {
    @State var favoriteStops = []
    let emptyFavoriteTransportErrorText: String = "Добавьте избранные\n остановки на карте"
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Избранные остановки")
                .font(.title.weight(.medium))
            ScrollView() {
                if favoriteStops.isEmpty {
                    ErrorPlain(errorText: emptyFavoriteTransportErrorText)
                }
            }
        }
        
    }
}
