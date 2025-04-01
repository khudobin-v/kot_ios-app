import SwiftUI

struct SearchModalView: View {
    @State private var searchText = ""
    @State var settingsSheetIsPresenting: Bool = false
    @Binding var sheetDetent: PresentationDetent
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                SearchBar(searchText: $searchText)
                .padding(.horizontal)
                .padding(.top, sheetDetent != .large ? 25 : 20)
                    GroupContainer(heading: "Избранное") {
                        HStack {
                            FavoriteView(name: "Транспорт", iconName: "bus.fill", childrenView: FavoriteTransportView())
                            Spacer()
                            FavoriteView(name: "Остановки", iconName: "mappin.and.ellipse", childrenView: FavoriteStopsView())
                            Spacer()
                            FavoriteView(name: "Маршруты", iconName: "arrow.triangle.branch", childrenView: FavoriteRoutesView())
                        }
                    }
                    RoutesGroupView(childrenView: RoutesListView())
                    Button(action: {settingsSheetIsPresenting = true}) {
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
                    .sheet(isPresented: $settingsSheetIsPresenting) {
                        VStack {
                            SettingsView().padding().padding(.top, 10)
                            Spacer()
                        }
                        .presentationDragIndicator(.visible)
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
