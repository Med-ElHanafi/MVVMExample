//
//  APIManager.swift
//  MVVMExample
//
//  Created by Mohamed El Hanafi on 7/17/19.
//  Copyright © 2019 Mohamed El Hanafi. All rights reserved.
//

import Foundation

class APIManager{
    static let session = URLSession(configuration: .default)
    static var dataTask: URLSessionDataTask?
    
    static func getUsers(completion: @escaping ([User]?,String?)->Void){
        dataTask?.cancel()
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            defer { self.dataTask = nil }
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil,error.localizedDescription)
                }
            }
            
            guard let dataResponse = data ,let users = try? JSONDecoder().decode([User].self, from: dataResponse) else{
                DispatchQueue.main.async {
                    completion(nil,"Error parsing data")
                }
                return
            }
            DispatchQueue.main.async {
                completion(users,nil)
            }
        })
        
        dataTask?.resume()
    }
}
