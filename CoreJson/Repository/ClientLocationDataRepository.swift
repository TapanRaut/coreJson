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
    typealias P = CDClientLocation
    
    func create(record: ClientLocation) -> CDClientLocation?{
        let cdClientLocation = CDClientLocation(context: PersistentStorage.shared.context)
        cdClientLocation.id = Int16(record.id ?? 0)
        cdClientLocation.clientID = Int16(record.clientID ?? 0)
        cdClientLocation.latitude = record.latitude
        cdClientLocation.longitude = record.longitude
        cdClientLocation.address = record.address
        cdClientLocation.addressAr = record.addressAr
        cdClientLocation.addressEn = record.addressEn
        cdClientLocation.buildingName = record.buildingName
        cdClientLocation.locationType = Int16(record.locationType ?? 0)
        cdClientLocation.locationTypeLabel = record.locationTypeLabel
        cdClientLocation.apartmentName = record.apartmentName
        cdClientLocation.requirePermission = record.requirePermission ?? false
        cdClientLocation.city = record.city
        cdClientLocation.zipCode = record.zipCode
        

        PersistentStorage.shared.saveContext()
        return cdClientLocation
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
    func getAllCDClientLocation() -> [CDClientLocation]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDClientLocation.self)
        guard records != nil && records?.count != 0 else {return nil}

        return records
    }
    
//    func get(byIdentifier id: Int) -> ClientLocation? {
//        let clientLocation = getAll()
//        guard clientLocation != nil else {return nil}
//        return (clientLocation?.convertToClientLocation())!
//    }
  
    func update(record: [ClientLocation]) -> Set<CDClientLocation> {
        var cdClientLocationArray = getAllCDClientLocation()
        guard cdClientLocationArray != nil  && cdClientLocationArray?.count != 0 else {return []}

        var clientLocationsSet = Set<CDClientLocation>()
    
        for i in 0...(cdClientLocationArray!.count - 1) {
            
            if cdClientLocationArray![i].id != Int16(record[i].id ?? 0){
                cdClientLocationArray![i].id = Int16(record[i].id ?? 0)
                print("Debug: ClientLocation id at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].clientID != Int16(record[i].clientID ?? 0){
                cdClientLocationArray![i].clientID = Int16(record[i].clientID ?? 0)
                print("Debug: ClientLocation clientID at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].latitude != record[i].latitude{
                cdClientLocationArray![i].latitude = record[i].latitude
                print("Debug: ClientLocation latitude at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].longitude != record[i].longitude{
                cdClientLocationArray![i].longitude = record[i].longitude
                print("Debug: ClientLocation longitude at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].address != record[i].address{
                cdClientLocationArray![i].address = record[i].address
                print("Debug: ClientLocation address at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].addressAr != record[i].addressAr{
                cdClientLocationArray![i].addressAr = record[i].addressAr
                print("Debug: ClientLocation addressAr at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].buildingName != record[i].buildingName{
                cdClientLocationArray![i].buildingName = record[i].buildingName
                print("Debug: ClientLocation buildingName at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].locationType != Int16(record[i].locationType ?? 0){
                cdClientLocationArray![i].locationType = Int16(record[i].locationType ?? 0)
                print("Debug: ClientLocation locationType at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].locationTypeLabel != record[i].locationTypeLabel{
                cdClientLocationArray![i].locationTypeLabel = record[i].locationTypeLabel
                print("Debug: ClientLocation locationTypeLabel at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].apartmentName != record[i].apartmentName{
                cdClientLocationArray![i].apartmentName = record[i].apartmentName
                print("Debug: ClientLocation apartmentName at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].requirePermission != record[i].requirePermission ?? false{
                cdClientLocationArray![i].requirePermission = record[i].requirePermission ?? false
                print("Debug: ClientLocation id at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].city != record[i].city{
                cdClientLocationArray![i].city = record[i].city
                print("Debug: ClientLocation city at postition \(i) in the array is updated")
            }
            if cdClientLocationArray![i].zipCode != record[i].zipCode{
                cdClientLocationArray![i].zipCode = record[i].zipCode
                print("Debug: ClientLocation zipCode at postition \(i) in the array is updated")
            }
            clientLocationsSet.insert(cdClientLocationArray![i])
            
        }
        
        

            PersistentStorage.shared.saveContext()
        return clientLocationsSet
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
