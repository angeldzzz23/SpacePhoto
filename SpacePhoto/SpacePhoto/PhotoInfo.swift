//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Angel Zambrano on 2/4/22.
//

import Foundation
import CoreText




struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?

    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    
}
