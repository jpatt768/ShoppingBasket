//
//  GooglePlacesCoordinator.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/20.
//

import Foundation
import CoreLocation


struct GooglePlacesCoordinator {
    let formatURL: String =
    "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=1000&type=supermarket&key=###############"

    func fetchLocation(for coordinate: CLLocationCoordinate2D, completion: @escaping (GMSPlaceField) -> Void) {
        let urlString = String(format: formatURL, coordinate.latitude, coordinate.longitude)
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, res, error in
            if let error = error{
                print(error)
                return
            }
            if let res = res as? HTTPURLResponse,
               res.statusCode >= 400 {
                print(res.statusCode)
                return
            }
            if let data = data {
                if let results = try? JSONDecoder().decode(GMSPlaceField.self, from: data) {
                    DispatchQueue.main.async {
                        completion(results)
                    }
                }
            }
        }

        task.resume()
    }
}
