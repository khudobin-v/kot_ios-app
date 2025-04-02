import SwiftUI

struct RouteButton: View {
    let transportType: TransportType
    let routeNumber: String
    var body: some View {
        Button(action: { }) {
            VStack(spacing: 4) {
                Image(transportType.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(routeNumber)
                    .font(.system(size: 32, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10)
                .fill(transportType.color)
            )
        }
    }
}

enum TransportType {
    case tram, trolleybus, bus
    
    var color: Color {
        switch self {
        case .tram:
            return .tram
        case .trolleybus:
            return .trolley
        case .bus:
            return .bus
        }
    }
    
    var icon: String {
        switch self {
        case .tram:
            return "tram"
        case .trolleybus:
            return "trolley"
        case .bus :
            return "bus"
        }
    }
}
