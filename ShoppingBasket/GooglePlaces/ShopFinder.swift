//
//  ShopFinder.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/20.
//

import Foundation
import GoogleMaps
import MapKit
import CoreLocation
import UIKit


class ShopFinderViewController: UIViewController, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        GMSServices.provideAPIKey("#############")
        
        print("License: \n\n\(GMSServices.openSourceLicenseInfo())")
    }
    let googlePlacesCoordinator = GooglePlacesCoordinator()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)

        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)

        googlePlacesCoordinator.fetchLocation(for: coordinate) { places in
            
            places.results.forEach { place in
                let loc = CLLocationCoordinate2D(
                    latitude: place.geometry.location.lat,
                    longitude: place.geometry.location.lng)
                let placeMaker = GMSMarker(position: loc)
                placeMaker.title = place.name
                placeMaker.map = mapView
            }
            
        }
        marker.map = mapView
    }
    
       
    
    
}
