import SwiftUI
import MapKit

struct SettingsView: View {
    @State var darkMode: Bool = false
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 45.040596, longitude: 38.976146),
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(Strings.Settings.title)
                .font(.title.weight(.medium))
            ScrollView() {
                VStack(alignment: .leading, spacing: 20) {
                    Text(Strings.Settings.description)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Strings.Settings.AppearanceSection.title)
                            .fontWeight(.medium)
                        Toggle(isOn: $darkMode) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(Strings.Settings.AppearanceSection.darkMode)
                                    .fontWeight(.medium)
                                Text(Strings.Settings.AppearanceSection.darkModeDescription)
                                    .font(.caption)
                            }
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Map(coordinateRegion: $region, interactionModes: [])
                            .frame(height: 200)
                            .cornerRadius(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Strings.Settings.DataSection.title)
                            .fontWeight(.medium)
                    }
                    Text(Strings.Settings.ResetAndDevelopmentSection.title)
                        .fontWeight(.medium)
                }
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
