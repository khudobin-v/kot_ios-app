import SwiftUI

struct SearchModalView: View {
    @State private var searchText = ""
    @Binding var sheetDetent: PresentationDetent
    struct Route: Identifiable {
        let id = UUID()
        let transportType: TransportType
        let routeNumber: String
    }
    
    let routes: [Route] = [
        Route(transportType: .tram, routeNumber: "8"),
        Route(transportType: .trolleybus, routeNumber: "21"),
        Route(transportType: .bus, routeNumber: "2Е")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                SearchBar(searchText: $searchText)
                .padding(.horizontal)
                .padding(.top, sheetDetent != .large ? 25 : 20)
                if (sheetDetent == .height(600)) {
                    GroupContainer(heading: "Избранное") {
                        HStack {
                            FavoriteView(name: "Транспорт", iconName: "bus.fill")
                            Spacer()
                            FavoriteView(name: "Остановки", iconName: "mappin.and.ellipse")
                            Spacer()
                            FavoriteView(name: "Маршруты", iconName: "arrow.triangle.branch")
                        }
                    }
                    GroupContainer(heading: "Маршруты", canNavigate: true) {
                        HStack {
                            ForEach(routes) { route in
                                RouteButton(transportType: route.transportType, routeNumber: route.routeNumber)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    Button(action: {}) {
                        HStack(spacing: 10) {
                            Image(systemName: "gearshape")
                            Text("Настройки")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 1)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    Button(action: {}) {
                        HStack(spacing: 10) {
                            Image(systemName: "questionmark.circle")
                            Text("Сообщить о проблеме")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 1)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    InfoBar()
                }
            }
            .frame(alignment: .top)
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
