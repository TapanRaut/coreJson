//
//  ClientCityExtension.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

extension CDClientCity {
    
    func convertToClientCity() -> ClientCity
    {
        return ClientCity(id: Int(self.id), nameAr: self.nameAr ?? "", nameEn: self.nameEn, name: self.name ?? "", status: Int(self.status), statusLabel: self.statusLabel ?? "", country: self.toCountry?.convertToCountry())
    }
    
   
}
