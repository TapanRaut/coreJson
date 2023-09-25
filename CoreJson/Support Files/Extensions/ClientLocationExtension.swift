//
//  ClientLocationExtension.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

extension CDClientLocation {
    
    
    func convertToClientLocation() -> ClientLocation
    {
        return ClientLocation(id: Int(self.id), clientID: Int(self.clientID), latitude: self.latitude ?? "", longitude: self.longitude ?? "", address: self.address ?? "", addressAr: self.addressAr ?? "", addressEn: self.addressEn ?? "", buildingName: self.buildingName ?? "", locationType: Int(self.locationType), locationTypeLabel: self.locationTypeLabel ?? "", apartmentName: self.apartmentName ?? "", requirePermission: self.requirePermission , city: self.city ?? "", zipCode: self.zipCode ?? "")
    }

}
