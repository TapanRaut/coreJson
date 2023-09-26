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
    typealias P = CDClientCity

    
    func create(record: ClientCity)-> CDClientCity?  {
        let cdClientCity = CDClientCity(context: PersistentStorage.shared.context)
        cdClientCity.id = Int16(record.id ?? 0)
        cdClientCity.nameAr = record.nameAr
        cdClientCity.nameEn = record.nameEn
        cdClientCity.name = record.name
        cdClientCity.status = Int16(record.status ?? 0)
        cdClientCity.statusLabel = record.statusLabel
        
        if(record.country != nil)
        {
            let _cdCountryDataRepository : CountryDataRepository = CountryDataRepository()
            
            cdClientCity.toCountry = _cdCountryDataRepository.create(record: record.country!)
        }
      
        
        PersistentStorage.shared.saveContext()
        return cdClientCity
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
        let cdClientCity = getAllClientCity()
        guard cdClientCity != nil else {return false}

        if cdClientCity!.id != Int16(record.id ?? 0){
            cdClientCity!.id = Int16(record.id ?? 0)
            print("Debug: ClientCity id  updated")
        }
        if cdClientCity!.nameAr != record.nameAr{
            cdClientCity!.nameAr = record.nameAr
            print("Debug: ClientCity nameAr updated")
        }
        if cdClientCity!.nameEn != record.nameEn{
            cdClientCity!.nameEn = record.nameEn
            print("Debug: ClientCity nameEn updated")
        }
        if cdClientCity!.name != record.name{
            cdClientCity!.name = record.name
            print("Debug: ClientCity name updated")
        }
        if cdClientCity!.status != Int16(record.status ?? 0){
            cdClientCity!.status = Int16(record.status ?? 0)
            print("Debug: ClientCity status updated")
        }
        if cdClientCity!.statusLabel != record.statusLabel{
            cdClientCity!.statusLabel = record.statusLabel
            print("Debug: ClientCity statusLabel updated")
        }
        
        if(record.country != nil)
        {
            let _cdCountryDataRepository : CountryDataRepository = CountryDataRepository()
            
            _cdCountryDataRepository.update(record: record.country!)
        }
      
            PersistentStorage.shared.saveContext()
      
        
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
