import SwiftUI

struct FavoriteTransportView: View {
    @State var favoriteTransport = []
    let emptyFavoriteTransportErrorText: String = "Добавьте избранный\n транспорт на карте"
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Избранный транспорт")
                .font(.title.weight(.medium))
            ScrollView() {
                if favoriteTransport.isEmpty {
                    ErrorPlain(errorText: emptyFavoriteTransportErrorText)
                }
            }
        }
        
    }
}
