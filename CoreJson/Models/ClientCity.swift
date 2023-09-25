//
//  ClientCity.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

class ClientCity: Codable{
    
    let id: Int?
    let nameAr, nameEn, name: String?
    let status: Int?
    let statusLabel: String?
    let country: Country?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameAr = "name_ar"
        case nameEn = "name_en"
        case name, status
        case statusLabel = "status_label"
        case country
    }
    
    init(id: Int?, nameAr: String?, nameEn: String?, name: String?, status: Int?, statusLabel: String?, country: Country?) {
        self.id = id
        self.nameAr = nameAr
        self.nameEn = nameEn
        self.name = name
        self.status = status
        self.statusLabel = statusLabel
        self.country = country
    }
    
}
