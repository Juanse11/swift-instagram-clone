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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return userProfile.posts.count
        }
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
        if indexPath.section == 0 {
            print(userProfile)
            let cell: PostProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "postProfileTableViewCell", for: indexPath) as! PostProfileTableViewCell
            cell.profilePictureImageView.layer.cornerRadius = cell.profilePictureImageView.frame.width/2.0
            let url = URL(string: userProfile.profilePicURL)
            cell.profilePictureImageView.kf.setImage(with: url)
            cell.biographyLabel.text = userProfile.biography
            cell.numberOfPostsLabel.text = userProfile.numberOfPosts.roundedWithAbbreviations
            cell.numberOfFollowersLabel.text = userProfile.followers.roundedWithAbbreviations
            cell.numberOfFollowingLabel.text = userProfile.following.roundedWithAbbreviations
            cell.fullNameLabel.text = userProfile.fullName
            
            if let categoryName = userProfile.categoryName {
                cell.categoryNameLabel.isHidden = false
                cell.categoryNameLabel.text = categoryName
            } else {
                cell.categoryNameLabel.isHidden = true
            }
            if let externalURL = userProfile.externalURL {
                cell.externalUrlLabel.isHidden = false
                cell.externalUrlLabel.text = externalURL
            } else {
                cell.externalUrlLabel.isHidden = true
            }
            
            
            return cell
        } else {
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
            
            let post = userProfile.posts[indexPath.row]
            
            cell.profilePictureImageView.layer.cornerRadius = cell.profilePictureImageView.frame.width/2.0
            cell.usernameLabel.text = userProfile.username
            cell.locationLabel.text = "Khalifa International Stadium"
            
            var url = URL(string: post.pictureURL)
            cell.postImageView.kf.setImage(with: url)
            let attributedText = NSMutableAttributedString(string: "\(userProfile.username) ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .semibold)])
            attributedText.append(NSMutableAttributedString(string: post.caption, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)]))
            cell.descriptionLabel.attributedText = attributedText
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            formatter.groupingSeparator = "."
            let numberOfLikes = formatter.string(from: NSNumber(value: post.numberOfLikes))
            cell.numberOfLikesLabel.text = "\(numberOfLikes ?? "0") likes"
            
            url = URL(string: userProfile.profilePicURL)
            cell.profilePictureImageView.kf.setImage(with: url)
            
            if post.numberOfComments > 0 {
                cell.numberOfCommentsLabel.text = "View all \(post.numberOfComments) comments"
            } else {
                cell.numberOfCommentsLabel.isHidden = true
            }
            
            let df = DateFormatter()
            df.dateFormat = "MMMM d"
            cell.dateLabel.text = "\(df.string(from: Date(timeIntervalSince1970: Double(post.date))))"
            
            return cell
        }
        
    }
    
}

