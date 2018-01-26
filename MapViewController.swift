//
//  MapViewController.swift
//  FriendlyChatSwift
//
//  Created by Banana on 26.01.18.
//  Copyright © 2018 Google Inc. All rights reserved.
//

import UIKit
import MapKit

import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
    
{
    @IBOutlet weak var bigMap: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        let annotation = MKPointAnnotation()

        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.bigMap.showsUserLocation = true
        annotation.coordinate = CLLocationCoordinate2D(latitude: 52.52, longitude: 13.40)
        bigMap.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        self.bigMap.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors " + error.localizedDescription)
    }
}
