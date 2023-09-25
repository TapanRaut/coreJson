//
//  CDOtp+CoreDataProperties.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//
//

import Foundation
import CoreData


extension CDOtp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDOtp> {
        return NSFetchRequest<CDOtp>(entityName: "CDOtp")
    }

    @NSManaged public var otp: String?
    @NSManaged public var toUser: CDUser?

}

extension CDOtp : Identifiable {

}
