//
//  Video.swift
//  VideoPlayer
//
//  Created by user on 2022/03/21.
//

import Foundation

struct Video: Decodable {
    
    let title: String
    let presenterName: String
    let description: String
    let thumbnailUrl: String
    let videoUrl: String
    let videoDuration: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case presenterName = "presenter_name"
        case description
        case thumbnailUrl = "thumbnail_url"
        case videoUrl = "video_url"
        case videoDuration = "video_duration"
    }
}

extension Video: Equatable { }
