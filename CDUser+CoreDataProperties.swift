//
//  CDUser+CoreDataProperties.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var clientID: Int16
    @NSManaged public var email: String?
    @NSManaged public var genderLabel: String?
    @NSManaged public var gender: String?
    @NSManaged public var mobile: String?
    @NSManaged public var codeCountry: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var avatar: String?
    @NSManaged public var smsNotification: Bool
    @NSManaged public var isMobileVerified: Bool
    @NSManaged public var toOtp: CDOtp?
    @NSManaged public var toClientCity: CDClientCity?
    @NSManaged public var toClientLocation: Set<CDClientLocation>?

}

// MARK: Generated accessors for toClientLocation
extension CDUser {

    @objc(addToClientLocationObject:)
    @NSManaged public func addToToClientLocation(_ value: CDClientLocation)

    @objc(removeToClientLocationObject:)
    @NSManaged public func removeFromToClientLocation(_ value: CDClientLocation)

    @objc(addToClientLocation:)
    @NSManaged public func addToToClientLocation(_ values: Set<CDClientLocation>)

    @objc(removeToClientLocation:)
    @NSManaged public func removeFromToClientLocation(_ values: Set<CDClientLocation>)

}

extension CDUser : Identifiable {

}
