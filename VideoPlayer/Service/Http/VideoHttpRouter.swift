//
//  VideoHttpRouter.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import Alamofire

enum VideoHttpRouter {
    case getVideos
}

extension VideoHttpRouter: HttpRouter {
    
    var baseUrlString: String {
        "https://quipper.github.io/native-technical-exam"
    }
    
    var path: String {
        switch self {
        case .getVideos:
            return "playlist.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getVideos:
            return .get
        }
    }
}
