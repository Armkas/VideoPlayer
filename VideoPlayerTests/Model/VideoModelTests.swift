//
//  VideoModelTests.swift
//  VideoPlayerTests
//
//  Created by user on 2022/03/28.
//

import Foundation
import XCTest
@testable import VideoPlayer

class VideoModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testDecodeVideoModel() {
        guard let playlist = DataProvider.jsonData(from: "playlist") else {
            XCTFail("File 'playlist.json' does not exist.")
            return
        }
        do {
            let decoder = JSONDecoder.convertFromIso8601
            let videos = try decoder.decode(VideosResponse.self, from: playlist)
            XCTAssertEqual(videos, DummyDataModel.dummyVideoModels)
            XCTAssertEqual(videos.count, 5)
            XCTAssertEqual(videos[0], DummyDataModel.dummyVideoModel1)
        } catch {
            XCTFail("Decode to failed.")
        }
    }
    
    func testPerformanceDecodeVideoModel() {
        guard let playlist = DataProvider.jsonData(from: "playlist") else {
            XCTFail("File 'playlist.json' does not exist.")
            return
        }
        measure {
            do {
                let decoder = JSONDecoder.convertFromIso8601
                let videos = try decoder.decode(VideosResponse.self, from: playlist)
                XCTAssertEqual(videos, DummyDataModel.dummyVideoModels)
            } catch {
                XCTFail("Decode to failed.")
            }
        }
    }
}
