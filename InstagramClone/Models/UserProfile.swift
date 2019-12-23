//
//  Request.swift
//  InstagramClone
//
//  Created by Juanse  on 22/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import ObjectMapper

struct UserProfile: Mappable {
    public var posts: [Post] = []
    public var numberOfPosts: Int = 0
    public var username: String = ""
    public var fullName: String = ""
    public var profilePicURL: String = ""
    public var followers: Int = 0
    public var following: Int = 0
    public var biography: String = ""
    public var categoryName: String?
    public var isPrivate: Bool = false
    public var isVerified: Bool = false
    public var externalURL: String?
    
    init?(map: Map) { }
    public init() {}
    mutating func mapping(map: Map) {
        posts <- map["graphql.user.edge_owner_to_timeline_media.edges"]
        numberOfPosts <- map["graphql.user.edge_owner_to_timeline_media.count"]
        username <- map["graphql.user.username"]
        fullName <- map["graphql.user.full_name"]
        profilePicURL <- map["graphql.user.profile_pic_url"]
        followers <- map["graphql.user.edge_followed_by.count"]
        following <- map["graphql.user.edge_follow.count"]
        biography <- map["graphql.user.biography"]
        categoryName <- map["graphql.user.business_category_name"]
        isPrivate <- map["graphql.user.is_private"]
        isVerified <- map["graphql.user.is_verified"]
        externalURL <- map["graphql.user.external_url"]
    }
    
    
}

