//
//  OtpDataRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation
import CoreData

protocol OtpRepository: BaseRepository{
    
}
struct OtpDataRepository: OtpRepository{
    
    typealias T = Otp
    typealias P = CDOtp
    
    func create(record: Otp) -> CDOtp? {
        let cdOtp = CDOtp(context: PersistentStorage.shared.context)
        cdOtp.otp = record.otp
        
        PersistentStorage.shared.saveContext()
        return cdOtp
    }
    
    func getAll() -> [Otp]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDOtp.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Otp] = []
        records!.forEach({ (cdOtp) in
            results.append(cdOtp.convertToOtp())
        })

        return results
    }
    
    func get(byIdentifier id: Int) -> Otp? {
        let otp = getCdOtp(byId: id)
        guard otp != nil else {return nil}
        return (otp?.convertToOtp())!
    }
    func getAllCDOtp() -> CDOtp? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDOtp.self)
        guard records != nil && records?.count != 0 else {return nil}

        return records?.first
    }
    
    func update(record: Otp) -> Bool {
        var otpData = getAllCDOtp()
        guard otpData != nil else {return false}
        
        if otpData!.otp != record.otp{
            otpData!.otp = record.otp
            print("Debug: Otp updated")
        }
            PersistentStorage.shared.saveContext()

        return true
    }
    
    
//    func delete(byIdentifier id: UUID) -> Bool {
//        let vehicle = getCdVehicle(byId: id)
//        guard vehicle != nil else {return false}
//
//        PersistentStorage.shared.context.delete(vehicle!)
//        PersistentStorage.shared.saveContext()
//
//        return true
//    }
    private func getCdOtp(byId id: Int) -> CDOtp?
    {
        let fetchRequest = NSFetchRequest<CDOtp>(entityName: "CDOtp")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
    
    
}
