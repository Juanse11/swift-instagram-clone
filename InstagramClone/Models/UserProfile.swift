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
    public var username: String = ""
    
    init?(map: Map) { }
    public init() {}
    mutating func mapping(map: Map) {
        posts <- map["graphql.user.edge_owner_to_timeline_media.edges"]
        username <- map["graphql.user.username"]
    }
    
    
}

