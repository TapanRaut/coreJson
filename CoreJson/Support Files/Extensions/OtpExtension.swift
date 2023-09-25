//
//  OtpExtension.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

extension CDOtp {
    
    func convertToOtp() -> Otp
    {
        return Otp(otp: self.otp ?? "")
    }
}
