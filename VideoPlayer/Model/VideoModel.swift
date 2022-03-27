//
//  VideoModel.swift
//  VideoPlayer
//
//  Created by user on 2022/03/21.
//

import Foundation

struct VideoModel: Codable {
    
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

//extension VideoModel: Equatable {
//    static func == (lhs: VideoModel, rhs: VideoModel) -> Bool {
//        return lhs.title == rhs.title
//    }
//}
//
//extension VideoModel: Hashable {
//    func hash(into hasher: inout Hasher){
//        hasher.combine(title)
//    }
//}
//
typealias VideosResponse = [VideoModel]
