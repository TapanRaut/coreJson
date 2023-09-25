//
//  CDCountry+CoreDataProperties.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//
//

import Foundation
import CoreData


extension CDCountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCountry> {
        return NSFetchRequest<CDCountry>(entityName: "CDCountry")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var codeCountry: String?
    @NSManaged public var avatar: String?
    @NSManaged public var status: Int16
    @NSManaged public var statusLabel: String?
    @NSManaged public var toClientCity: CDClientCity?

}

extension CDCountry : Identifiable {

}
