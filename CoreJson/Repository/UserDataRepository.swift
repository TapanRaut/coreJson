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
    
    func create(record: User) {
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
            let cdOtp = CDOtp(context: PersistentStorage.shared.context)
            cdOtp.otp = record.otp?.otp
            
            cdUser.toOtp = cdOtp
        }
        if(record.clientCity != nil)
        {
            let cdClientCity = CDClientCity(context: PersistentStorage.shared.context)
            cdClientCity.id = Int16(record.id ?? 0)
            cdClientCity.nameAr = record.clientCity?.nameAr
            cdClientCity.nameEn = record.clientCity?.nameEn
            cdClientCity.name = record.clientCity?.name
            cdClientCity.status = Int16(record.clientCity?.status ?? 0)
            cdClientCity.statusLabel = record.clientCity?.statusLabel
            
            cdUser.toClientCity = cdClientCity
        }
        
        
        if(record.clientLocations != nil && record.clientLocations?.count != 0)
        {
            var clientLocationsSet = Set<CDClientLocation>()
            record.clientLocations?.forEach({ (clientLocation) in

                let cdClientLocation = CDClientLocation(context: PersistentStorage.shared.context)
                cdClientLocation.id = Int16(clientLocation.id ?? 0)
                cdClientLocation.clientID = Int16(clientLocation.clientID ?? 0)
                cdClientLocation.latitude = clientLocation.latitude
                cdClientLocation.longitude = clientLocation.longitude
                cdClientLocation.address = clientLocation.address
                cdClientLocation.addressAr = clientLocation.addressAr
                cdClientLocation.buildingName = clientLocation.buildingName
                cdClientLocation.locationType = Int16(clientLocation.locationType ?? 0)
                cdClientLocation.locationTypeLabel = clientLocation.locationTypeLabel
                cdClientLocation.apartmentName = clientLocation.apartmentName
                cdClientLocation.requirePermission = clientLocation.requirePermission ?? false
                cdClientLocation.city = clientLocation.city
                cdClientLocation.zipCode = clientLocation.zipCode

                clientLocationsSet.insert(cdClientLocation)
            })

            cdUser.toClientLocation = clientLocationsSet
        }
        PersistentStorage.shared.saveContext()
       
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
            let cdOtp = CDOtp(context: PersistentStorage.shared.context)
            if cdOtp.otp != record.otp?.otp{
                cdOtp.otp = record.otp?.otp
                print("otp updated")
            }
            
            cdUser?.toOtp = cdOtp
        }
        
        
        
        if(record.clientCity != nil)
        {
            cdUser?.toClientCity
            let cdClientCity = CDClientCity(context: PersistentStorage.shared.context)
            if cdClientCity.id != Int16(record.id ?? 0){
                cdClientCity.id = Int16(record.id ?? 0)
                print("user ClientCity id updated")
            }
            if cdClientCity.nameAr != record.clientCity?.nameAr{
                cdClientCity.nameAr = record.clientCity?.nameAr
                print("user ClientCity nameAr updated")
            }
            if cdClientCity.nameEn != record.clientCity?.nameEn{
                cdClientCity.nameEn = record.clientCity?.nameEn
                print("user ClientCity nameEn updated")
            }
            if cdClientCity.name != record.clientCity?.name{
                cdClientCity.name = record.clientCity?.name
                print("user ClientCity name updated")
            }
            if cdClientCity.status != Int16(record.clientCity?.status ?? 0){
                cdClientCity.status = Int16(record.clientCity?.status ?? 0)
                print("user ClientCity status updated")
            }
            if cdClientCity.statusLabel != record.clientCity?.statusLabel{
                cdClientCity.statusLabel = record.clientCity?.statusLabel
                print("user ClientCity statusLabel updated")
            }
            
            cdUser?.toClientCity = cdClientCity
        }
        
        
        if(record.clientLocations != nil && record.clientLocations?.count != 0)
        {
            var clientLocationsSet = Set<CDClientLocation>()
            record.clientLocations?.forEach({ (clientLocation) in
                
                let cdClientLocation = CDClientLocation(context: PersistentStorage.shared.context)
                if cdClientLocation.id != Int16(clientLocation.id ?? 0){
                    cdClientLocation.id = Int16(clientLocation.id ?? 0)
                    print("user ClientLocation id updated")
                }
                if cdClientLocation.clientID != Int16(clientLocation.clientID ?? 0){
                    cdClientLocation.clientID = Int16(clientLocation.clientID ?? 0)
                    print("user ClientLocation clientID updated")
                }
                if cdClientLocation.latitude != clientLocation.latitude{
                    cdClientLocation.latitude = clientLocation.latitude
                    print("user ClientLocation latitude updated")
                }
                if cdClientLocation.longitude != clientLocation.longitude{
                    cdClientLocation.longitude = clientLocation.longitude
                    print("user ClientLocation longitude updated")
                }
                if cdClientLocation.address != clientLocation.address{
                    cdClientLocation.address = clientLocation.address
                    print("user ClientLocation address updated")
                }
                if cdClientLocation.addressAr != clientLocation.addressAr{
                    cdClientLocation.addressAr = clientLocation.addressAr
                    print("user ClientLocation addressAr updated")
                }
                if cdClientLocation.buildingName != clientLocation.buildingName{
                    cdClientLocation.buildingName = clientLocation.buildingName
                    print("user ClientLocation buildingName updated")
                }
                if cdClientLocation.locationType != Int16(clientLocation.locationType ?? 0){
                    cdClientLocation.locationType = Int16(clientLocation.locationType ?? 0)
                    print("user ClientLocation locationType updated")
                }
                if cdClientLocation.locationTypeLabel != clientLocation.locationTypeLabel{
                    cdClientLocation.locationTypeLabel = clientLocation.locationTypeLabel
                    print("user ClientLocation locationTypeLabel updated")
                }
                if cdClientLocation.apartmentName != clientLocation.apartmentName{
                    cdClientLocation.apartmentName = clientLocation.apartmentName
                    print("user ClientLocation apartmentName updated")
                }
                
                if cdClientLocation.requirePermission != clientLocation.requirePermission ?? false{
                    cdClientLocation.requirePermission = clientLocation.requirePermission ?? false
                    print("user ClientLocation requirePermission updated")
                }
                if cdClientLocation.city != clientLocation.city{
                    cdClientLocation.city = clientLocation.city
                    print("user ClientLocation city updated")
                }
                if cdClientLocation.zipCode != clientLocation.zipCode{
                    cdClientLocation.zipCode = clientLocation.zipCode
                    print("user ClientLocation zipCode updated")
                }
                
                clientLocationsSet.insert(cdClientLocation)
            })
            
            cdUser?.toClientLocation = clientLocationsSet
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
//        <#code#>
//    }
    
}
