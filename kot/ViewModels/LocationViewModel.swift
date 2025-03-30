import Foundation
import CoreLocation
import SwiftUI
import MapKit

class LocationViewModel: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var model = LocationModel()  // Оставляем @Published
    private var mapView: MKMapView?
    private var displayLink: CADisplayLink?
    private var startTime: CFTimeInterval = 0
    private var startHeading: Double = 0
    private var targetHeading: Double = 0
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func toggleTracking() {
        model.trackingState = model.trackingState == .availableButNotTracked ? .locationOnly : .availableButNotTracked
    }
    
    func stopTrackingOnMapMove() {
        if model.trackingState == .locationOnly {
            model.trackingState = .availableButNotTracked
        }
    }
    
    func resetRotation() {
        guard let mapView = mapView else { return }
        let camera = mapView.camera
        startHeading = camera.heading
        targetHeading = 0 // Всегда поворачиваем к 0 градусам
        
        // Останавливаем предыдущую анимацию если она есть
        displayLink?.invalidate()
        
        // Создаем новую анимацию
        startTime = CACurrentMediaTime()
        displayLink = CADisplayLink(target: self, selector: #selector(updateRotation))
        displayLink?.add(to: .current, forMode: .common)
    }
    
    @objc private func updateRotation() {
        guard let mapView = mapView else { return }
        let camera = mapView.camera
        
        let duration: CFTimeInterval = 1.0
        let elapsed = CACurrentMediaTime() - startTime
        let progress = min(elapsed / duration, 1.0)
        
        // Используем easeInOut для плавного ускорения и замедления
        let easedProgress = progress < 0.5 ? 2 * progress * progress : 1 - pow(-2 * progress + 2, 2) / 2
        
        // Вычисляем кратчайший путь поворота
        let rotation = startHeading > 180 ? (360 - startHeading) : -startHeading
        let currentHeading = startHeading + (rotation * easedProgress)
        camera.heading = currentHeading
        mapView.setCamera(camera, animated: false)
        
        if progress >= 1.0 {
            displayLink?.invalidate()
            displayLink = nil
        }
    }
    
    deinit {
        displayLink?.invalidate()
    }
    
    var buttonIcon: String {
        if model.location == nil {
            return "location.slash"
        }
        switch model.trackingState {
        case .availableButNotTracked:
            return "location"
        case .locationOnly:
            return "location.fill"
        }
    }
    
    func zoomIn() {
        guard let mapView = mapView else { return }
        let currentRegion = mapView.region
        let newSpan = MKCoordinateSpan(
            latitudeDelta: currentRegion.span.latitudeDelta * 0.5,
            longitudeDelta: currentRegion.span.longitudeDelta * 0.5
        )
        let newRegion = MKCoordinateRegion(center: currentRegion.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func zoomOut() {
        guard let mapView = mapView else { return }
        let currentRegion = mapView.region
        let newSpan = MKCoordinateSpan(
            latitudeDelta: currentRegion.span.latitudeDelta * 2,
            longitudeDelta: currentRegion.span.longitudeDelta * 2
        )
        let newRegion = MKCoordinateRegion(center: currentRegion.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    func setMapView(_ mapView: MKMapView) {
        self.mapView = mapView
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        model.location = locations.first
    }
}
