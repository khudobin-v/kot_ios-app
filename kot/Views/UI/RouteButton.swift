import SwiftUI

struct RouteButton: View {
    let transportType: TransportType
    let routeNumber: String
    var body: some View {
        Button(action: { }) {
            VStack(spacing: 4) {
                Image(systemName: transportType.icon)
                    .font(.system(size: 32))
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
            return .red
        case .trolleybus:
            return .blue
        case .bus:
            return .green
        }
    }
    
    var icon: String {
        switch self {
        case .tram:
            return "tram"
        case .trolleybus:
            return "bus.doubledecker.fill"
        case .bus :
            return "bus.fill"
        }
    }
}
