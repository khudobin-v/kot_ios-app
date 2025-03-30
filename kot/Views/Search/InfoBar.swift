import SwiftUI

struct InfoBar: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("Россия, г. Краснодар. \(String(Calendar.current.component(.year, from: Date()))) © KRDPT")
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 8) {
                Text("Условия сервиса")
                Text("Авторы")
                Text("Telegram")
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
