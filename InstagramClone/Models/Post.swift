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
    
    init?(map: Map) { }
    public init() {}
    mutating func mapping(map: Map) {
        id <- map["node.id"]
        caption <- map["node.edge_media_to_caption.edges.0.node.text"]
        pictureURL <- map["node.display_url"]
    }
    
    
}
