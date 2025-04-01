import SwiftUI

struct InfoBar: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("\(String(Strings.InfoBar.address)) \(String(Calendar.current.component(.year, from: Date()))) © \(String(Strings.InfoBar.organization))")
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 8) {
                Text(Strings.InfoBar.Menu.termsOfService)
                Text(Strings.InfoBar.Menu.authors)
                Text(Strings.InfoBar.Menu.telegram)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.callout.weight(.medium))
        .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
        .padding(.horizontal)
        
        
    }
}
