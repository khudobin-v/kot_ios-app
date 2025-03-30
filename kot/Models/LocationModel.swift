import Foundation
import CoreLocation

enum TrackingState {
    case availableButNotTracked
    case locationOnly
}

struct LocationModel {
    var location: CLLocation?
    var trackingState: TrackingState = .availableButNotTracked
}
