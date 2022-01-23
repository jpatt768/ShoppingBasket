//
//  Results.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/20.
//

import Foundation

struct GMSPlaceField: Codable {
    let results: [PlaceResult]
}

struct PlaceResult: Codable {
    let geometry: PlaceGeometry
    let name: String
}

struct PlaceGeometry: Codable {
    let location: PlaceGeometryLocation
}

struct PlaceGeometryLocation: Codable {
    let lat: Double
    let lng: Double
}
