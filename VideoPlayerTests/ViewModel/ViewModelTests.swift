//
//  File.swift
//  VideoPlayerTests
//
//  Created by user on 2022/03/28.
//

import Foundation
import XCTest
import RxSwift
import RxCocoa
@testable import VideoPlayer

class ViewModelTests: XCTestCase {
    
    let viewModel = ViewModel()
    private let bag: DisposeBag = .init()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModel() {
        self.viewModel.getVideos()
        
        viewModel.videos
            .subscribe(onNext: { (videos) in
                XCTAssertEqual(videos, DummyDataModel.dummyVideoModels)
                XCTAssertEqual(videos.count, 5)
            })
            .disposed(by: bag)
    }

}
