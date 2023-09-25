//
//  ClientCityDataRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation
import CoreData

protocol ClientCityRepository: BaseRepository{
    
}
struct ClientCityDataRepository: ClientCityRepository{
    
    typealias T = ClientCity

    
    func create(record: ClientCity) {
        let cdClientCity = CDClientCity(context: PersistentStorage.shared.context)
        cdClientCity.id = Int16(record.id ?? 0)
        cdClientCity.nameAr = record.nameAr
        cdClientCity.nameEn = record.nameEn
        cdClientCity.name = record.name
        cdClientCity.status = Int16(record.status ?? 0)
        cdClientCity.statusLabel = record.statusLabel
        
        if(record.country != nil)
        {
            let cdcountry = CDCountry(context: PersistentStorage.shared.context)
            cdcountry.name = record.country?.name
            cdcountry.avatar = record.country?.avatar
            cdcountry.statusLabel = record.country?.statusLabel
            cdcountry.status = Int16(record.country?.status ?? 0)
            cdcountry.codeCountry = record.country?.codeCountry
            cdClientCity.toCountry = cdcountry
        }
      

        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [ClientCity]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDClientCity.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [ClientCity] = []
        records!.forEach({ (cdClientCity) in
            results.append(cdClientCity.convertToClientCity())
        })

        return results
    }
    func getAllClientCity() -> CDClientCity? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDClientCity.self)
        guard records != nil && records?.count != 0 else {return nil}

        return records?.first
    }
    
    func get(byIdentifier id: Int) -> ClientCity? {
        let clientCity = getCdClientCity(byId: id)
        guard clientCity != nil else {return nil}
        return (clientCity?.convertToClientCity())!
    }

    func update(record: ClientCity) -> Bool {
        let ClientCity = getAllClientCity()
        guard ClientCity != nil else {return false}

        let cdClientCity = CDClientCity(context: PersistentStorage.shared.context)
        if cdClientCity.id != Int16(record.id ?? 0){
            cdClientCity.id = Int16(record.id ?? 0)
        }
        if cdClientCity.nameAr != record.nameAr{
            cdClientCity.nameAr = record.nameAr
        }
        if cdClientCity.nameEn != record.nameEn{
            cdClientCity.nameEn = record.nameEn
        }
        if cdClientCity.name != record.name{
            cdClientCity.name = record.name
        }
        if cdClientCity.status != Int16(record.status ?? 0){
            cdClientCity.status = Int16(record.status ?? 0)
        }
        if cdClientCity.statusLabel != record.statusLabel{
            cdClientCity.statusLabel = record.statusLabel
        }
        
        if(record.country != nil)
        {
            let cdcountry = CDCountry(context: PersistentStorage.shared.context)
            if cdcountry.name != record.country?.name{
                cdcountry.name = record.country?.name
            }
            if cdcountry.avatar != record.country?.avatar{
                cdcountry.avatar = record.country?.avatar
            }
            if cdcountry.statusLabel != record.country?.statusLabel{
                cdcountry.statusLabel = record.country?.statusLabel
            }
            if cdcountry.status != Int16(record.country?.status ?? 0){
                cdcountry.status = Int16(record.country?.status ?? 0)
            }
            if cdcountry.codeCountry != record.country?.codeCountry{
                cdcountry.codeCountry = record.country?.codeCountry
            }
            cdClientCity.toCountry = cdcountry
        }
      
        if PersistentStorage.shared.context.hasChanges{
            PersistentStorage.shared.saveContext()
        }
        
        return true
    }
//
//    //
//    func delete(byIdentifier id: UUID) -> Bool {
//        let vehicle = getCdVehicle(byId: id)
//        guard vehicle != nil else {return false}
//
//        PersistentStorage.shared.context.delete(vehicle!)
//        PersistentStorage.shared.saveContext()
//
//        return true
//    }
    private func getCdClientCity(byId id: Int) -> CDClientCity?
    {
        let fetchRequest = NSFetchRequest<CDClientCity>(entityName: "CDClientCity")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
//
}
