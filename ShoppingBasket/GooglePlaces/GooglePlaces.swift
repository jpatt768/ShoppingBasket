//
//  GooglePlaces.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/11.
//
import GoogleMaps
import CoreLocation
import UIKit

class ShopFinderViewController: UIViewController, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        GMSServices.provideAPIKey("AIzaSyCLUM_DkUu0hdfvUEa1RiAVmEsSi2ew9bs")
        
        print("License: \n\n\(GMSServices.openSourceLicenseInfo())")
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
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
        marker.map = mapView
    }
    
}
