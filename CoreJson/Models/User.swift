//
//  User.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation


class ClientResponse: Codable {
     let success: Bool?
       let message: String?
       let data: DataClass?

       init(success: Bool?, message: String?, data: DataClass?) {
           self.success = success
           self.message = message
           self.data = data
       }
}

class DataClass: Codable {
    let user: User?
    let role, token: String?

    init(user: User?, role: String?, token: String?) {
        self.user = user
        self.role = role
        self.token = token
    }
}


class User: Codable {
    let id: Int?
    let name: String?
    let clientID: Int?
    let email: String?
    let genderLabel, gender: String?
    let mobile, codeCountry: String?
    let birthDate: String?
    let avatar: String?
    let smsNotification, isMobileVerified: Bool?
    let otp: Otp?
    let clientCity: ClientCity?
    let clientLocations: [ClientLocation]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case clientID = "client_id"
        case email
        case genderLabel = "gender_label"
        case gender, mobile
        case codeCountry = "code_country"
        case birthDate = "birth_date"
        case avatar
        case smsNotification = "sms_notification"
        case isMobileVerified = "is_mobile_verified"
        case otp
        case clientCity = "client_city"
        case clientLocations = "client_locations"
    }

    init(id: Int?, name: String?, clientID: Int?, email: String?, genderLabel: String?, gender: String?, mobile: String?, codeCountry: String?, birthDate: String?, avatar: String?, smsNotification: Bool?, isMobileVerified: Bool?, otp: Otp?, clientCity: ClientCity?, clientLocations: [ClientLocation]?) {
        self.id = id
        self.name = name
        self.clientID = clientID
        self.email = email
        self.genderLabel = genderLabel
        self.gender = gender
        self.mobile = mobile
        self.codeCountry = codeCountry
        self.birthDate = birthDate
        self.avatar = avatar
        self.smsNotification = smsNotification
        self.isMobileVerified = isMobileVerified
        self.otp = otp
        self.clientCity = clientCity
        self.clientLocations = clientLocations
    }
}
