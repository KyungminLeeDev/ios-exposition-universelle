//
//  Item.swift
//  Expo1900
//
//  Created by Kyungmin Lee on 2020/12/24.
//

import Foundation

struct Item: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
