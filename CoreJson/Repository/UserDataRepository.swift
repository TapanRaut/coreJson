//
//  UserDataRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation
import CoreData

protocol UserRepository: BaseRepository{
    
}
struct UserDataRepository: UserRepository{
   
    
    typealias T = User
    typealias P = CDUser
    
    func create(record: User) -> CDUser? {
        let cdUser = CDUser(context: PersistentStorage.shared.context)
        cdUser.id = Int16(record.id ?? 0)
        cdUser.name = record.name
        cdUser.clientID = Int16(record.clientID ?? 0)
        cdUser.genderLabel = record.genderLabel
        cdUser.gender = record.gender
        cdUser.mobile = record.mobile
        cdUser.birthDate = record.birthDate
        cdUser.avatar = record.avatar
        cdUser.smsNotification = record.smsNotification ?? false
        cdUser.codeCountry = record.codeCountry
        cdUser.email = record.email
        cdUser.isMobileVerified = record.isMobileVerified!
        
        if(record.otp != nil)
        {
            let _cdOtpDataRepository : OtpDataRepository = OtpDataRepository()
            
            cdUser.toOtp =  _cdOtpDataRepository.create(record: record.otp!)

        }
        if(record.clientCity != nil)
        {
            
            let _cdClientCityRepository : ClientCityDataRepository = ClientCityDataRepository()
            
            cdUser.toClientCity = _cdClientCityRepository.create(record: record.clientCity!)
 
        }
        
        
        if(record.clientLocations != nil && record.clientLocations?.count != 0)
        {
            
            let _cdClientLocationRepository : ClientLocationDataRepository = ClientLocationDataRepository()
            var clientLocationsSet = Set<CDClientLocation>()
            record.clientLocations?.forEach({ (clientLocation) in
                
                clientLocationsSet.insert(_cdClientLocationRepository.create(record: clientLocation)!)
            })
            cdUser.toClientLocation = clientLocationsSet
        }
        PersistentStorage.shared.saveContext()
        return cdUser
    }
    
    func getAll() -> [User]? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDUser.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [User] = []
        records!.forEach({ (cdUser) in
            results.append(cdUser.convertToUser())
        })

        return results
    }
    func getAllCDUser() -> CDUser? {
        let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDUser.self)
        guard records != nil && records?.count != 0 else {return nil}

        return records?.first
    }
    
    func get(byIdentifier id: Int) -> User? {
        let user = get(byId: id)
        guard user != nil else {return nil}
        return (user?.convertToUser())!
    }
    
    private func get(byId id: Int) -> CDUser?
    {
        let fetchRequest = NSFetchRequest<CDUser>(entityName: "CDUser")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }

    
    func update(record: User) -> Bool {
        let cdUser = getAllCDUser()
        guard cdUser != nil else {return false}
        
        if cdUser?.id != Int16(record.id ?? 0){
            cdUser?.id = Int16(record.id ?? 0)
            print("user Id updated")
        }
        
        if cdUser?.name != record.name{
            cdUser?.name = record.name
            print("user name updated")
        }
        if (cdUser?.clientID != Int16(record.clientID ?? 0)){
            cdUser?.clientID = Int16(record.clientID ?? 0)
            print("clientId updated")
        }
        if cdUser?.genderLabel != record.genderLabel{
            cdUser?.genderLabel = record.genderLabel
            print("genderLabel updated")
        }
        
        if cdUser?.gender != record.gender{
            cdUser?.gender = record.gender
            print("gender updated")
        }
        if cdUser?.mobile != record.mobile{
            cdUser?.mobile = record.mobile
            print("mobile updated")
        }
        
        if cdUser?.birthDate != record.birthDate{
            cdUser?.birthDate = record.birthDate
            print("gender updated")
        }
        
        if cdUser?.avatar != record.avatar{
            cdUser?.avatar = record.avatar
            print("avatar updated")
        }
        
        if(record.otp != nil)
        {
            let _cdOtpDataRepository : OtpDataRepository = OtpDataRepository()
            
            _cdOtpDataRepository.update(record: record.otp!)
        }
        
        
        
        if(record.clientCity != nil)
        {
            let _cdClientCityRepository : ClientCityDataRepository = ClientCityDataRepository()
            
            _cdClientCityRepository.update(record: record.clientCity!)
            
           
        }
        
        
        if(record.clientLocations != nil && record.clientLocations?.count != 0)
        {
            
                let _cdClientLocationRepository : ClientLocationDataRepository = ClientLocationDataRepository()
//            var clientLocationsSet = Set<CDClientLocation>()
            cdUser?.toClientLocation = _cdClientLocationRepository.update(record: record.clientLocations!)
//            record.clientLocations?.forEach({ (clientLocation) in
                
//                _cdClientLocationRepository.update(record: clientLocation)
                
//                clientLocationsSet.insert(cdClientLocation)
//            })
//
//            cdUser?.toClientLocation = clientLocationsSet
        }
            PersistentStorage.shared.saveContext()
        
            
            return true
        }
    
//
//
//
//    func delete(byIdentifier id: UUID) -> Bool {
//        <#code#>
//    }
    
}
