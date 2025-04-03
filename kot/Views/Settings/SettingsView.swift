import SwiftUI
import MapKit

struct SettingsView: View {
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Strings.Settings.title)
                .font(.title.weight(.medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 20)
            ScrollView {
                VStack(spacing: 10) {
                    Text(Strings.Settings.description)
                        .font(.callout)
                    AppearanceSection(darkModeIsOn: $themeManager.isDarkMode)
                    DataSection()
                    ResetAndDevelopmentSection()
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}


extension SettingsView {
    struct SectionPlain<Content: View>: View {
        let content: Content
        var body: some View {
            content
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct AppearanceSection: View {
        @Binding var darkModeIsOn: Bool
        @State var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 45.040595, longitude: 38.976057),
                span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            )
        @State var iconSize: Double = 5
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(Strings.Settings.AppearanceSection.title)
                    .font(.callout.weight(.medium))
                SectionPlain(content: Toggle(isOn: $darkModeIsOn) {
                    VStack(alignment: .leading) {
                        Text(Strings.Settings.AppearanceSection.darkMode)
                            .font(.callout.weight(.medium))
                        Text(Strings.Settings.AppearanceSection.darkModeDescription)
                            .font(.caption)
                            .opacity(0.75)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                })
                SectionPlain(content: VStack(alignment: .leading, spacing: 10) {
                    Map(coordinateRegion: $region, interactionModes: [])
                        .frame(height: 200)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Strings.Settings.AppearanceSection.iconsSize)
                            .font(.callout.weight(.medium))
                        Slider(value: $iconSize, in: 1...9, step: 1.0)
                    }
                })
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct DataSection: View {
        @State var dataSavingModeIsOn: Bool = false
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(Strings.Settings.DataSection.title)
                    .font(.callout.weight(.medium))
                SectionPlain(content: Toggle(isOn: $dataSavingModeIsOn) {
                    VStack(alignment: .leading) {
                        Text(Strings.Settings.DataSection.dataSaving)
                            .font(.callout.weight(.medium))
                        Text(Strings.Settings.DataSection.dataSavingDescription)
                            .font(.caption)
                            .opacity(0.75)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                })
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct ResetAndDevelopmentSection: View {
        @State var developmentModeIsOn: Bool = false
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(Strings.Settings.ResetAndDevelopmentSection.title)
                    .font(.callout.weight(.medium))
                SectionPlain(content: Toggle(isOn: $developmentModeIsOn) {
                    VStack(alignment: .leading) {
                        Text(Strings.Settings.ResetAndDevelopmentSection.developmentMode)
                            .font(.callout.weight(.medium))
                        Text(Strings.Settings.ResetAndDevelopmentSection.developmentModeDescription)
                            .font(.caption)
                            .opacity(0.75)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                })
                VStack(spacing: 10) {
                    Button(action: {}) {
                        Text(Strings.Settings.ResetAndDevelopmentSection.resetSettings)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button(action: {}) {
                        Text(Strings.Settings.ResetAndDevelopmentSection.resetFavorites)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
        }
    }
}
