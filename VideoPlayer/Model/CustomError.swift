//
//  CustomError.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation

enum CustomError: Error {
    case error(message: String)
}

//enum CustomError: Error {
//    case invalidResponse
//    case unknown(Error)
//}
//
//extension CustomError {
//    
//    var title: String {
//        switch self {
//            case .invalidResponse: return "無効なレスポンスです。"
//            case .unknown(let error): return "予期せぬエラーが発生しました。\(error)"
//        }
//    }
//}
