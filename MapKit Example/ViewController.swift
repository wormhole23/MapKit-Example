//
//  ViewController.swift
//  MapKit Example
//
//  Created by Aziza Kamet on 15.11.16.
//  Copyright © 2016 Aziza Kamet. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if(CLLocationManager.locationServicesEnabled()) {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
        }
        
        self.mapView.showsUserLocation = true
        self.genData()
    }
    
    func genData() {
        
        let place1 = Place(title: "Zhambyl Zhabaev", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.228614, 76.960800))
        let place2 = Place(title: "Beatles ", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.129998, 76.905035))
        let place3 = Place(title: "Manshuk Mametova", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.251249, 76.894864))
        let place4 = Place(title: "Abay", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.238931, 76.897097))
        
        mapView.addAnnotation(place1)
        mapView.addAnnotation(place2)
        mapView.addAnnotation(place3)
        mapView.addAnnotation(place4)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let regionRadius : CLLocationDistance = 1000
    var spanx = 0.0
    var spany = 0.0
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func onZoomIn(_ sender: AnyObject) {
        
        let userLocation = mapView.centerCoordinate
        let span = mapView.region.span
        spanx = span.latitudeDelta * 0.0001
        spany = span.longitudeDelta * 0.0001
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation, spanx, spany)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func onZoomOut(_ sender: AnyObject) {
        
        let userLocation = mapView.centerCoordinate
        let span = mapView.region.span
        spanx = span.latitudeDelta * 100
        spany = span.longitudeDelta * 100
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation, spanx, spany)
        
        mapView.setRegion(region, animated: true)
        
    }
    
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.centerMapOnLocation(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
