//
//  File.swift
//  VideoPlayerTests
//
//  Created by user on 2022/03/28.
//

import Foundation
import XCTest
@testable import VideoPlayer

class DataProvider {
    static func jsonData(from filename: String) -> Data? {
        guard let filePath = Bundle(for: DataProvider.self).path(forResource: filename, ofType: "json") else {
            return nil
        }
        do {
            let contents = try Data(contentsOf: URL(fileURLWithPath: filePath))
            return contents
        } catch {
            return nil
        }
    }
}
