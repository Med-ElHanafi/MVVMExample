//
//  ViewController.swift
//  MVVMExample
//
//  Created by Mohamed El Hanafi on 7/17/19.
//  Copyright © 2019 Mohamed El Hanafi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let cellId = "cellId"
    @IBOutlet weak var tableView: UITableView!
    var userViewModels: [UserViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTableView()
        getUsers()
    }

    func setTableView(){
        self.tableView.dataSource = self
        self.tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        
        cell.userViewModel = userViewModels[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModels.count
    }
}
// API CALL
extension ViewController{
    func getUsers(){
        APIManager.getUsers { (users, err) in
            if let error = err{
                print(error)
            }
            
            guard let usersArray = users else{
                return
            }
            self.userViewModels = usersArray.map({ (user) -> UserViewModel in
                return UserViewModel(user: user)
            })
            self.tableView.reloadData()
        }
    }
}
