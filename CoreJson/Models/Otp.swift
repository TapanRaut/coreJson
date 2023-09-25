//
//  Otp.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

class Otp: Codable {
    var otp: String?

    init(otp: String?) {
        self.otp = otp 
    }
}
