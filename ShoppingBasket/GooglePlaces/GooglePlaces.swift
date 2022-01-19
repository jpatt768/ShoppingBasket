//
//  GooglePlaces.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/11.
//
import GoogleMaps
import MapKit
import CoreLocation
import UIKit

class ShopFinderViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var MKMap: MKMapView!
    
    let manager = CLLocationManager()
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        GMSServices.provideAPIKey("AIzaSyBTcf18KxrKCyhmBIeflVDibbvs5jcHhs8")
        
        print("License: \n\n\(GMSServices.openSourceLicenseInfo())")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top,
                               width: view.safeAreaInsets.right,
                               height: view.safeAreaInsets.bottom)
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

