//
//  CDClientLocation+CoreDataProperties.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//
//

import Foundation
import CoreData


extension CDClientLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDClientLocation> {
        return NSFetchRequest<CDClientLocation>(entityName: "CDClientLocation")
    }

    @NSManaged public var id: Int16
    @NSManaged public var clientID: Int16
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var address: String?
    @NSManaged public var addressAr: String?
    @NSManaged public var addressEn: String?
    @NSManaged public var buildingName: String?
    @NSManaged public var locationType: Int16
    @NSManaged public var locationTypeLabel: String?
    @NSManaged public var apartmentName: String?
    @NSManaged public var requirePermission: Bool
    @NSManaged public var city: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var toUser: CDUser?

}

extension CDClientLocation : Identifiable {

}
