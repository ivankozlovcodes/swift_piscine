//
//  ViewController.swift
//  ex01
//
//  Created by Ivan Kozlov on 10/8/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        let region = MKCoordinateRegion(center: locValue,
                                        span: MKCoordinateSpanMake(0.05, 0.05))

        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Ivan Kozlov"
        annotation.subtitle = "current location"

        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
}
