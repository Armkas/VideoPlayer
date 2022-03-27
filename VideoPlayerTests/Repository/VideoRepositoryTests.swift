//
//  VideoRepositoryTests.swift
//  VideoPlayerTests
//
//  Created by user on 2022/03/28.
//

import Foundation
import RxSwift
import XCTest
@testable import VideoPlayer

class VideoRepositoryTests: XCTestCase {
    let repository = VideoRepository()

    private let disposeBag: DisposeBag = .init()

    func testGetVideos() {
        let exp = expectation(description: "Get videos from repository")
        repository.getVideos()
            .subscribe(onNext: { (VideosResponse) in
                XCTAssertEqual(VideosResponse, DummyDataModel.dummyVideoModels)
                exp.fulfill()
            })
            .disposed(by: disposeBag)
        wait(for: [exp], timeout: 30)
    }
}
