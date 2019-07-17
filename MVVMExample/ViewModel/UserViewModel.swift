//
//  UserViewModel.swift
//  MVVMExample
//
//  Created by Mohamed El Hanafi on 7/17/19.
//  Copyright © 2019 Mohamed El Hanafi. All rights reserved.
//

import Foundation
import UIKit

struct UserViewModel{
    let name: String
    let descriptionText: String
    let accessory: UITableViewCell.AccessoryType
    
    // Dependency Injection
    init(user: User) {
        self.name = user.name
        self.descriptionText = "email: \(user.email) - website: \(user.website)"
        
        if user.id % 3 == 0{
            self.accessory = .checkmark
        }else{
            self.accessory = .none
        }
    }
}
