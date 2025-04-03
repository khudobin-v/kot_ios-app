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
                    GroupContainer(heading: Strings.SearchModal.FavoritesGroup.title) {
                        HStack {
                            FavoriteView(name: Strings.SearchModal.FavoritesGroup.Transport.title, iconName: "bus.fill", childrenView: FavoriteTransportView())
                            Spacer()
                            FavoriteView(name: Strings.SearchModal.FavoritesGroup.Stops.title, iconName: "mappin.and.ellipse", childrenView: FavoriteStopsView())
                            Spacer()
                            FavoriteView(name: Strings.SearchModal.FavoritesGroup.Routes.title, iconName: "arrow.triangle.branch", childrenView: FavoriteRoutesView())
                        }
                    }
                    RoutesGroupView(childrenView: RoutesListView())
                    Button(action: {settingsSheetIsPresenting = true}) {
                        HStack(spacing: 10) {
                            Image(systemName: "gearshape")
                            Text(Strings.Settings.title)
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
                            SettingsView()
                            Spacer()
                        }
                        .presentationDragIndicator(.visible)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                    Button(action: {}) {
                        HStack(spacing: 10) {
                            Image(systemName: "questionmark.circle")
                            Text(Strings.ReportIssue.title)
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
