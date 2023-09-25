//
//  ViewController.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var users : User? = nil
    private var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userViewModel.getUserRecord {[weak self] userRecords in
            DispatchQueue.main.async {
                if(userRecords != nil){
                    self?.users = userRecords
                    
                }
            }
        }
        
    }
}
