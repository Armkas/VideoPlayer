//
//  VideoDataSourceTests.swift
//  VideoPlayerTests
//
//  Created by user on 2022/03/28.
//

import Foundation
import RxSwift
import XCTest
@testable import VideoPlayer

class VideoDataSourceTests: XCTestCase {
    let dataSource = VideoDataSource()
    let disposeBag: DisposeBag = .init()
    
    func testGetVideo() {
        let exp = expectation(description: "Get video from data source")

        dataSource.getVideos()
            .subscribe(onNext: { videos in
                XCTAssertEqual(videos, DummyDataModel.dummyVideoModels)
                exp.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [exp], timeout: 30)
    }
    
}
