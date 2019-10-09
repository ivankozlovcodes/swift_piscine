//
//  ViewController.swift
//  ex03
//
//  Created by Ivan Kozlov on 10/8/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewControllerEx03: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var addressTextInput: UITextField!

    let locationManager = CLLocationManager()

    
    @IBAction func asdasd() {
        if let addressText = addressTextInput.text {
            buildRoute(location: addressText)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        mapView.delegate = self
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        let region = MKCoordinateRegion(center: locValue,
                                        span: MKCoordinateSpanMake(0.05, 0.05))

        mapView.setRegion(region, animated: true)
    }

    func buildRoute(location: String) {
        let geocoder: CLGeocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let placemarks = placemarks {
                let request: MKDirectionsRequest = MKDirectionsRequest()
                
                request.source = MKMapItem.forCurrentLocation()
                request.destination = MKMapItem(placemark: MKPlacemark(placemark: placemarks.first!))
                
                //        request.requestsAlternateRoutes = true
                request.transportType = .automobile
                
                MKDirections(request: request).calculate { (response, error) in
                    if let routeResponse = response?.routes {
                        if let route = routeResponse.first {
                            self.displayRoute(route: route)
                        }
                        print(routeResponse)
                    } else if let error = error {
                        print(error)
                    }
                }
            }
        }
    }
    
    func displayRoute(route: MKRoute) {
        mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0), animated: false)
        mapView.removeOverlays(mapView.overlays)
        mapView.add(route.polyline)
    }
    
    func mapView(_ mapView: MKMapView,
                 rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        if (overlay is MKPolyline) {
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 5
        }
        return polylineRenderer
    }
}

