import SwiftUI

struct StarButton: View {
    @State private var starButtonState: StarButtonState = .slashStar
    var body: some View {
        Button(action: {
            starButtonState.toggle()
        }) {
            Image(systemName: starButtonState.iconName)
        }
        .circleButtonStyle()
    }
}

enum StarButtonState {
    case fillStar, slashStar
    var iconName: String {
        switch self {
        case .fillStar:
            return "star.fill"
        case .slashStar:
            return "star.slash"
        }
    }
    
    mutating func toggle() {
        self = (self == .fillStar) ? .slashStar : .fillStar
    }
}
