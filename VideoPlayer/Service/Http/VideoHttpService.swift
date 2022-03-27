//
//  VideoHttpService.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import Alamofire

class VideoHttpService: HttpService {
    
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
}
