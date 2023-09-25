//
//  UserViewModel.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation


struct UserViewModel {
    
    private let _cdUserDataRepository : UserDataRepository = UserDataRepository()
    private let _userApiRepository: UserApiResponseRepository = UserApiResponseRepository()
    
    func getUserRecord(completionHandler:@escaping(_ result: User?)-> Void) {
        
            _userApiRepository.getUserRecords { apiResponse in
                if(apiResponse != nil){
                    
                    let response = _cdUserDataRepository.getAll()
                    if(response != nil && response?.count != 0){
                        _cdUserDataRepository.update(record: (apiResponse)!)
                        completionHandler(response?.first)
                    }
                    else{
                        // insert record in core data
                        _cdUserDataRepository.create(record: apiResponse!)
                        completionHandler(apiResponse)
                    }
                    
                    
                    
                }
            
            
            
        }
    }
}
