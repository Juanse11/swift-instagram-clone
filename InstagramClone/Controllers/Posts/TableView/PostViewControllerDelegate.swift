//
//  PostViewControllerDelegate.swift
//  InstagramClone
//
//  Created by Juanse  on 21/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import UIKit

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfile.posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "exampleSectionView") as! ExampleSectionView
    //        header.numberLabel.text = "Contacts"
    //        return header
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
    
        let post = userProfile.posts[indexPath.row]
        
        cell.profilePictureImageView.layer.cornerRadius = cell.profilePictureImageView.frame.width/2.0
        cell.usernameLabel.text = "liverpoolfc"
        cell.locationLabel.text = "Khalifa International Stadium"
        var url = URL(string: post.pictureURL)
        cell.postImageView.kf.setImage(with: url)
        let attributedText = NSMutableAttributedString(string: "liverpoolfc ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .semibold)])
        attributedText.append(NSMutableAttributedString(string: post.caption, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)]))
       
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.groupingSeparator = "."
        let numberOfLikes = formatter.string(from: NSNumber(value: post.numberOfLikes))
        cell.numberOfLikesLabel.text = "\(numberOfLikes ?? "0") likes"
        
        cell.descriptionLabel.attributedText = attributedText
        
        url = URL(string: userProfile.profilePicURL)
        cell.profilePictureImageView.kf.setImage(with: url)
        
        return cell
        
    }
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            let contact = contacts[indexPath.row]
    //            if let id = contact.id {
    //                ContactController.delete(id) { (contact, contacts) in
    //                    DispatchQueue.main.async {
    //                        self.contacts.remove(at: indexPath.row)
    //                        self.tableView.deleteRows(at: [indexPath], with: .fade)
    //                    }
    //                }
    //            }
    //
    //
    //        } else if editingStyle == .insert {
    //
    //        }
    //    }
    
}

