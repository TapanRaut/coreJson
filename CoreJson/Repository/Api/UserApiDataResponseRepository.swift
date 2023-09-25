//
//  UserApiDataResponseRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation

protocol UserDataBaseRepository {
    func getUserRecords(completionHandler:@escaping(_ result: User?)->Void)
}
