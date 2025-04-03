import SwiftUI

extension Color {
    static let darkGreen = Color(red: 0, green: 153 / 255, blue: 0)
    
    static let tramTransport = Color(hex: "df1c22")
    static let trolleyTransport = Color(hex: "1468F5")
    static let busTransport = Color(hex: "03AD00")
    static let ebusTransport = Color(hex: "00B0C8")
    static let grossTransport = Color(hex: "D124AB")
    static let commercialTransport = Color(hex: "A018D0")
    static let serviceTransport = Color(hex: "333333")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: 
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: 
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: 
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    static let tram = Color(red: 223 / 255, green: 28 / 255, blue: 34 / 255)
    static let trolley = Color(red: 20 / 255, green: 104 / 255, blue: 245 / 255)
    static let bus = Color(red: 3 / 255, green: 173 / 255, blue: 0 / 255)
    static let ebus = Color(red: 0 / 255, green: 176 / 255, blue: 200 / 255)
    static let gross = Color(red: 209 / 255, green: 36 / 255, blue: 171 / 255)
    static let commercial = Color(red: 160 / 255, green: 24 / 255, blue: 208 / 255)
    static let service = Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255)
}
