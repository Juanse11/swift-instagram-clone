//
//  FirstViewController.swift
//  InstagramClone
//
//  Created by Juanse  on 21/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var postTableView: UITableView!
    
    var userProfileStore = UserProfileStore()
    var username: String?
    var userProfile = UserProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        if let username = username {
            userProfileStore.fetchUser(username) { (user) in
                if let userProfile = user {
                    self.userProfile = userProfile
                    self.postTableView.reloadData()
                }
            }
        }
        
    }
    
    func config() {
        navigationBar.title = username ?? ""
        navigationBar.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        postTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postTableViewCell")
        postTableView.register(UINib(nibName: "PostProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "postProfileTableViewCell")
        
        postTableView.estimatedRowHeight = 100
        postTableView.separatorStyle = .none
        postTableView.allowsSelection = false
    }


}

