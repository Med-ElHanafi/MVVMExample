//
//  UserCell.swift
//  MVVMExample
//
//  Created by Mohamed El Hanafi on 7/17/19.
//  Copyright © 2019 Mohamed El Hanafi. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    var userViewModel: UserViewModel!{
        didSet{
            self.textLabel?.text = userViewModel.name
            self.detailTextLabel?.text = userViewModel.descriptionText
            self.accessoryType = userViewModel.accessory
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
