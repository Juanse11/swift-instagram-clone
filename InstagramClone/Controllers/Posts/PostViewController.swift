//
//  FirstViewController.swift
//  InstagramClone
//
//  Created by Juanse  on 21/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    
    var userProfileStore = UserProfileStore()
    var userProfile = UserProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        userProfileStore.fetchUsers { (userProfile) in
            if let userProfile = userProfile {
                self.userProfile = userProfile
                self.postTableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func config() {
        postTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postTableViewCell")
        postTableView.estimatedRowHeight = 100
        postTableView.separatorStyle = .none
        postTableView.allowsSelection = false
    }


}

