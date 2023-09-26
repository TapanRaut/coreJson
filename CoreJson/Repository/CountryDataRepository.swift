//
//  CountryDataRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation
import CoreData

protocol CountryRepository: BaseRepository{
    
}
struct CountryDataRepository: CountryRepository{
    
    typealias T = Country
    typealias P = CDCountry
    
    func create(record: Country) -> CDCountry? {
        let cdCountry = CDCountry(context: PersistentStorage.shared.context)
        cdCountry.name = record.name
        cdCountry.avatar = record.avatar
        cdCountry.statusLabel = record.statusLabel
        cdCountry.status = Int16(record.status ?? 0)
        cdCountry.codeCountry = record.codeCountry

        

        PersistentStorage.shared.saveContext()
        return cdCountry
    }
    
    func getAll() -> [Country]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDCountry.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Country] = []
        records!.forEach({ (cdCountry) in
            results.append(cdCountry.convertToCountry())
        })

        return results
    }
    func getAllCDCountry() -> CDCountry? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDCountry.self)
        guard records != nil && records?.count != 0 else {return nil}

        return records?.first
    }
    
    func get(byIdentifier id: Int) -> Country? {
        let country = getCdCountry(byId: id)
        guard country != nil else {return nil}
        return (country?.convertToCountry())!
    }
    
    func update(record: Country) -> Bool {
        let cdCountry = getAllCDCountry()
        guard cdCountry != nil else {return false}

        
        if cdCountry!.name != record.name{
            cdCountry!.name = record.name
            print("Debug: Country name updated")
        }
        if cdCountry!.avatar != record.avatar{
            cdCountry!.avatar = record.avatar
            print("Debug: Country name updated")
        }
        
        if cdCountry!.statusLabel != record.statusLabel{
            cdCountry!.statusLabel = record.statusLabel
            print("Debug: Country avatar updated")
        }
        if cdCountry!.status != Int16(record.status ?? 0){
            cdCountry!.status = Int16(record.status ?? 0)
            print("Debug: Country status updated")
        }
        
        if cdCountry!.codeCountry != record.codeCountry{
            cdCountry!.codeCountry = record.codeCountry
            print("Debug: Country code updated")
        }

            PersistentStorage.shared.saveContext()
        
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
    private func getCdCountry(byId id: Int) -> CDCountry?
    {
        let fetchRequest = NSFetchRequest<CDCountry>(entityName: "CDCountry")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
//    
}
