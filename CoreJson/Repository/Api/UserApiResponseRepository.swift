//
//  UserApiResponseRepository.swift
//  CoreJson
//
//  Created by Tapan Raut on 24/09/23.
//

import Foundation
import CoreData

struct UserApiResponseRepository: UserDataBaseRepository {
   
    func getUserRecords(completionHandler: @escaping (User?) -> Void) {
        
        
        let jsonData = readLocalJSONFile(forName: "sample")
                if let data = jsonData {
                    if let sampleUserObj = parse(jsonData: data) {
                        completionHandler(sampleUserObj)
                        
                        
                    }
                }
        
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
             do {
                 if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                     let fileUrl = URL(fileURLWithPath: filePath)
                     let data = try Data(contentsOf: fileUrl)
                     return data
                 }
             } catch {
                 print("error: \(error)")
             }
             return nil
         }
         func parse(jsonData: Data) -> User? {
             do {
                 let decodedData = try JSONDecoder().decode(ClientResponse.self, from: jsonData)
                 return decodedData.data?.user
             } catch {
                 print("error: \(error)")
             }
             return nil
         }



}

