//
//  ClientLocation.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation


class ClientLocation: Codable {
    let id, clientID: Int?
    let latitude, longitude, address, addressAr: String?
    let addressEn, buildingName: String?
    let locationType: Int?
    let locationTypeLabel: String?
    let apartmentName: String?
    let requirePermission: Bool?
    let city, zipCode: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case clientID = "client_id"
        case latitude, longitude, address
        case addressAr = "address_ar"
        case addressEn = "address_en"
        case buildingName = "building_name"
        case locationType = "location_type"
        case locationTypeLabel = "location_type_label"
        case apartmentName = "apartment_name"
        case requirePermission = "require_permission"
        case city
        case zipCode = "zip_code"
    }

    init(id: Int?, clientID: Int?, latitude: String?, longitude: String?, address: String?, addressAr: String?, addressEn: String?, buildingName: String?, locationType: Int?, locationTypeLabel: String?, apartmentName: String?, requirePermission: Bool?, city: String?, zipCode: String?) {
        self.id = id
        self.clientID = clientID
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.addressAr = addressAr
        self.addressEn = addressEn
        self.buildingName = buildingName
        self.locationType = locationType
        self.locationTypeLabel = locationTypeLabel
        self.apartmentName = apartmentName
        self.requirePermission = requirePermission
        self.city = city
        self.zipCode = zipCode
    }
}
