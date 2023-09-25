//
//  ClientLocationDataRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation
import CoreData

protocol ClientLocationRepository: BaseRepository{
    
}
struct ClientLocationDataRepository: ClientLocationRepository{
    
    typealias T = ClientLocation
    
    func create(record: ClientLocation) {
        let cdClientLocation = CDClientLocation(context: PersistentStorage.shared.context)
        cdClientLocation.id = Int16(record.id ?? 0)
        cdClientLocation.clientID = Int16(record.clientID ?? 0)
        cdClientLocation.latitude = record.latitude
        cdClientLocation.longitude = record.longitude
        cdClientLocation.address = record.address
        cdClientLocation.addressAr = record.addressAr
        cdClientLocation.buildingName = record.buildingName
        cdClientLocation.locationType = Int16(record.locationType ?? 0)
        cdClientLocation.locationTypeLabel = record.locationTypeLabel
        cdClientLocation.apartmentName = record.apartmentName
        cdClientLocation.requirePermission = record.requirePermission ?? false
        cdClientLocation.city = record.city
        cdClientLocation.zipCode = record.zipCode
        

        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [ClientLocation]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDClientLocation.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [ClientLocation] = []
        records!.forEach({ (cdClientLocation) in
            results.append(cdClientLocation.convertToClientLocation())
        })

        return results
    }
    func getAllCDClientLocation() -> CDClientLocation? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDClientLocation.self)
        guard records != nil && records?.count != 0 else {return nil}

        return records?.first
    }
    
//    func get(byIdentifier id: Int) -> ClientLocation? {
//        let clientLocation = getAll()
//        guard clientLocation != nil else {return nil}
//        return (clientLocation?.convertToClientLocation())!
//    }
  
    func update(record: ClientLocation) -> Bool {
        let clientLocation = getAllCDClientLocation()
        guard clientLocation != nil else {return false}

        let cdClientLocation = CDClientLocation(context: PersistentStorage.shared.context)
        if cdClientLocation.id != Int16(record.id ?? 0){
            cdClientLocation.id = Int16(record.id ?? 0)
        }
        if cdClientLocation.clientID != Int16(record.clientID ?? 0){
            cdClientLocation.clientID = Int16(record.clientID ?? 0)
        }
        if cdClientLocation.latitude != record.latitude{
            cdClientLocation.latitude = record.latitude
        }
        if cdClientLocation.longitude != record.longitude{
            cdClientLocation.longitude = record.longitude
        }
        if cdClientLocation.address != record.address{
            cdClientLocation.address = record.address
        }
        if cdClientLocation.addressAr != record.addressAr{
            
        }
        if cdClientLocation.buildingName != record.buildingName{
            cdClientLocation.buildingName = record.buildingName
        }
        if cdClientLocation.locationType != Int16(record.locationType ?? 0){
            cdClientLocation.locationType = Int16(record.locationType ?? 0)
        }
        if cdClientLocation.locationTypeLabel != record.locationTypeLabel{
            cdClientLocation.locationTypeLabel = record.locationTypeLabel
        }
        if cdClientLocation.apartmentName != record.apartmentName{
            cdClientLocation.apartmentName = record.apartmentName
        }
        if cdClientLocation.requirePermission != record.requirePermission ?? false{
            cdClientLocation.requirePermission = record.requirePermission ?? false
        }
        if cdClientLocation.city != record.city{
            cdClientLocation.city = record.city
        }
        if cdClientLocation.zipCode != record.zipCode{
            cdClientLocation.zipCode = record.zipCode
        }

        if PersistentStorage.shared.context.hasChanges{
            PersistentStorage.shared.saveContext()
        }
        return true
    }
//    
//    
//    
//    func delete(byIdentifier id: UUID) -> Bool {
//        let vehicle = getCdVehicle(byId: id)
//        guard vehicle != nil else {return false}
//
//        PersistentStorage.shared.context.delete(vehicle!)
//        PersistentStorage.shared.saveContext()
//
//        return true
//    }
    private func getCdClientLocation(byId id: Int) -> CDClientLocation?
    {
        let fetchRequest = NSFetchRequest<CDClientLocation>(entityName: "CDClientLocation")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
    
}
