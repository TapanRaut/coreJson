//
//  UserExtension.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation


extension CDUser {

    func convertToUser() -> User
    {
        return User(id: Int(self.id), name: self.name ?? "", clientID: Int(self.clientID), email: self.email ?? "", genderLabel: self.genderLabel ?? "", gender: self.gender ?? "", mobile: self.mobile ?? "", codeCountry: self.codeCountry ?? "", birthDate: self.birthDate ?? "", avatar: self.avatar ?? "", smsNotification: self.smsNotification, isMobileVerified: self.isMobileVerified, otp: self.toOtp?.convertToOtp(), clientCity: self.toClientCity?.convertToClientCity(), clientLocations: self.convertToClientLocation())
    }
    
    private func convertToClientLocation() -> [ClientLocation]?
    {
        guard self.toClientLocation != nil && self.toClientLocation?.count != 0 else {return nil}

        var clientLocations: [ClientLocation] = []

        self.toClientLocation?.forEach({ (cdClientLocation) in
            clientLocations.append(cdClientLocation.convertToClientLocation())
        })

        return clientLocations
    }
}
