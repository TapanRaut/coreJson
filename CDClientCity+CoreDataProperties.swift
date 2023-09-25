//
//  CDClientCity+CoreDataProperties.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//
//

import Foundation
import CoreData


extension CDClientCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDClientCity> {
        return NSFetchRequest<CDClientCity>(entityName: "CDClientCity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var nameAr: String?
    @NSManaged public var nameEn: String?
    @NSManaged public var name: String?
    @NSManaged public var status: Int16
    @NSManaged public var statusLabel: String?
    @NSManaged public var toUser: CDUser?
    @NSManaged public var toCountry: CDCountry?

}

extension CDClientCity : Identifiable {

}
