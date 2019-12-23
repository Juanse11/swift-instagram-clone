//
//  UserProfileStore.swift
//  InstagramClone
//
//  Created by Juanse  on 22/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import ObjectMapper
import Alamofire

struct UserProfileStore {
    var baseURL = "https://www.instagram.com"
    
    func fetchUser(_ username: String, _ completion: @escaping(_ users: UserProfile?) -> Void ) {
        AF.request("\(baseURL)/\(username)/?__a=1", method: .get, encoding: JSONEncoding.default).validate().responseJSON { (response) in
            if let value = response.value as? [String: Any] {
                let users = Mapper<UserProfile>().map(JSON: value)
                DispatchQueue.main.async {
                    completion(users)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
            
        }
        
    }
}
