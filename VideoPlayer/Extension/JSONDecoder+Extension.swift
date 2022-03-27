//
//  JSONDecoder+Extension.swift
//  VideoPlayer
//
//  Created by user on 2022/03/28.
//

import Foundation

extension JSONDecoder {
    static var convertFromSnakeCaseAndIso8601: JSONDecoder {
        let decoder: JSONDecoder = JSONDecoder.convertFromIso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    static var convertFromIso8601: JSONDecoder {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
