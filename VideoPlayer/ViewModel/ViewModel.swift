//
//  ViewModel.swift
//  VideoPlayer
//
//  Created by user on 2022/03/21.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {
    
    private let videoService: VideoAPI
    private let _videos: BehaviorRelay<[VideoModel]> = .init(value: [])
    var videos: Observable<[VideoModel]> { _videos.asObservable() }
    var listOfVideos: [VideoModel] { _videos.value }
    private let bag = DisposeBag()
    
    init(_ videoService: VideoAPI) {
        self.videoService = videoService
        getVideos()
    }
}

extension ViewModel {
    
    func getVideos() {
        self.videoService
            .fetchVideos()
            .map { videos in
                self._videos.accept(videos)
            }
            .subscribe()
            .disposed(by:bag)
    }
}
