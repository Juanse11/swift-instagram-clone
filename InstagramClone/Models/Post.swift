//
//  Post.swift
//  InstagramClone
//
//  Created by Juanse  on 22/12/19.
//  Copyright © 2019 Juanse. All rights reserved.
//

import ObjectMapper

struct Post: Mappable {
    public var id: String = ""
    public var caption: String = ""
    public var pictureURL: String = ""
    public var numberOfLikes: Int = 0
    public var numberOfComments: Int = 0
    public var date: Int = 0
    
    init?(map: Map) { }
    public init() {}
    mutating func mapping(map: Map) {
        id <- map["node.id"]
        caption <- map["node.edge_media_to_caption.edges.0.node.text"]
        pictureURL <- map["node.display_url"]
        numberOfLikes <- map["node.edge_liked_by.count"]
        numberOfComments <- map["node.edge_media_to_comment.count"]
        date <- map["node.taken_at_timestamp"]
    }
    
    
}
