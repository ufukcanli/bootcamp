//
//  MapViewController.swift
//  Homework1
//
//  Created by Ufuk Canlı on 21.01.2022.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var firstBarButton: UIBarButtonItem!
    @IBOutlet private weak var secondBarButton: UIBarButtonItem!
    
    private var sourceLocation: CLLocationCoordinate2D?
    private var destinationLocation: CLLocationCoordinate2D?
    
    private var sourcePlaceMark: MKPlacemark?
    private var destinationPlaceMark: MKPlacemark?
    
    private var sourceMapItem: MKMapItem?
    private var destinationItem: MKMapItem?
    
    private var currentRouteIndex = 0
    private var currentRouteOverlay: MKPolyline?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        configureLocations()
        configurePlaceMarks()
        configureAnnotations()
        configurePath()
    }
    
    @IBAction func didTapFirstRouteButton(_ sender: UIBarButtonItem) {
        currentRouteIndex = 0
        configurePath()
    }
    
    @IBAction func didTapSecondRouteButton(_ sender: UIBarButtonItem) {
        currentRouteIndex = 1
        configurePath()
    }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let rendere = MKPolylineRenderer(overlay: overlay)
        rendere.lineWidth = 5
        rendere.strokeColor = .systemBlue
        return rendere
    }
}

// MARK: - Helper Methods
private extension MapViewController {
    
    func configureLocations() {
        sourceLocation = CLLocationCoordinate2D(
            latitude: 41.213970,
            longitude: 32.654980
        )
        destinationLocation = CLLocationCoordinate2D(
            latitude: 41.2456658,
            longitude: 32.6929575
        )
    }
    
    func configurePlaceMarks() {
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation!, addressDictionary: nil)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation!, addressDictionary: nil)
        
        sourceMapItem = MKMapItem(placemark: sourcePlaceMark)
        destinationItem = MKMapItem(placemark: destinationPlaceMark)
    }
    
    func configureAnnotations() {
        let sourceAnotation = MKPointAnnotation()
        sourceAnotation.title = "Karabuk University"
        sourceAnotation.subtitle = ""
        if let location = sourcePlaceMark?.location {
            sourceAnotation.coordinate = location.coordinate
        }
        
        let destinationAnotation = MKPointAnnotation()
        destinationAnotation.title = "Safranbolu"
        destinationAnotation.subtitle = ""
        if let location = destinationPlaceMark?.location {
            destinationAnotation.coordinate = location.coordinate
        }
        
        mapView.showAnnotations([sourceAnotation, destinationAnotation], animated: true)
    }
    
    func configurePath() {
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationItem
        directionRequest.transportType = .automobile
        directionRequest.requestsAlternateRoutes = true
        
        let direction = MKDirections(request: directionRequest)
        direction.calculate { [self] response, error in
            guard let response = response else { return }

            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let currentRouteOverlay = currentRouteOverlay {
                mapView.removeOverlay(currentRouteOverlay)
            }
                        
            let route = response.routes[currentRouteIndex]
            currentRouteOverlay = route.polyline
            mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
}
