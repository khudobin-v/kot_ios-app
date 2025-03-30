import SwiftUI
import MapKit

struct CustomMapView: UIViewRepresentable {
    @Binding var location: CLLocation?
    @Binding var mapRotation: Double
    @Binding var trackingState: TrackingState
    
    let viewModel: LocationViewModel
    
    private let krasnodarCoordinate = CLLocationCoordinate2D(latitude: 45.0355, longitude: 38.9753)
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        mapView.showsCompass = false
        mapView.isRotateEnabled = true
        mapView.isPitchEnabled = true
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        let region = MKCoordinateRegion(
            center: krasnodarCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        mapView.setRegion(region, animated: false)
        viewModel.setMapView(mapView)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        guard let location = location else {
            return
        }
        switch trackingState {
        case .availableButNotTracked:
            if uiView.camera.altitude == 0 {
                uiView.setRegion(
                    MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
                    ),
                    animated: true
                )
            }
        case .locationOnly:
            let camera = MKMapCamera()
            camera.centerCoordinate = location.coordinate
            camera.altitude = 1000
            uiView.setCamera(camera, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel: viewModel)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: CustomMapView
        var viewModel: LocationViewModel
        
        init(_ parent: CustomMapView, viewModel: LocationViewModel) {
            self.parent = parent
            self.viewModel = viewModel
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            viewModel.stopTrackingOnMapMove()
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            DispatchQueue.main.async {
                self.parent.mapRotation = mapView.camera.heading
            }
        }
    }
    
    func zoomIn(_ mapView: MKMapView) {
        let currentRegion = mapView.region
        let newSpan = MKCoordinateSpan(
            latitudeDelta: currentRegion.span.latitudeDelta * 0.5,
            longitudeDelta: currentRegion.span.longitudeDelta * 0.5
        )
        let newRegion = MKCoordinateRegion(center: currentRegion.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func zoomOut(_ mapView: MKMapView) {
        let currentRegion = mapView.region
        let newSpan = MKCoordinateSpan(
            latitudeDelta: currentRegion.span.latitudeDelta * 2,
            longitudeDelta: currentRegion.span.longitudeDelta * 2
        )
        let newRegion = MKCoordinateRegion(center: currentRegion.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
}
