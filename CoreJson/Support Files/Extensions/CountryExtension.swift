//
//  CountryExtension.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

extension CDCountry {

    func convertToCountry() -> Country
    {
        return Country(id: Int(self.id) , name: self.name ?? "", codeCountry: self.codeCountry ?? "", avatar: self.avatar ?? "", status: Int(self.status) , statusLabel: self.statusLabel ?? "")
    }
    
}
