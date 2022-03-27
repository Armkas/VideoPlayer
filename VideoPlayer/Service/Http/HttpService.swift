//
//  HttpService.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import Alamofire

protocol HttpService {
    var sessionManager: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
