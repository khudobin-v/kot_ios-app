import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapRotation: Double = 0.0
    @StateObject private var viewModel = LocationViewModel()
    @State private var sheetDetent: PresentationDetent = .height(80)
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        ZStack {
            CustomMapView(
                location: Binding(
                    get: { viewModel.model.location },
                    set: { _ in }
                ),
                mapRotation: $mapRotation,
                trackingState: Binding(
                    get: { viewModel.model.trackingState },
                    set: { _ in }
                ),
                viewModel: viewModel
            )
            .edgesIgnoringSafeArea(.all)
            MapControlsButtons(mapRotation: $mapRotation, viewModel: viewModel)
        }
        .sheet(isPresented: .constant(true)) {
            SearchModalView(sheetDetent: $sheetDetent)
                .presentationDetents([.height(80), .height(600)], selection: $sheetDetent)
                .presentationDragIndicator(.visible)
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled(true)
        }
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}
