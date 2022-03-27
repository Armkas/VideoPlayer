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
    
    private let videoRepository = VideoRepository()
    private let _videos: BehaviorRelay<[VideoModel]> = .init(value: [])
    var videos: Observable<[VideoModel]> { _videos.asObservable() }
    var listOfVideos: [VideoModel] { _videos.value }
    private let bag = DisposeBag()
    
    init() {
        getVideos()
    }
}

extension ViewModel {
    
    func getVideos() {
        return videoRepository.getVideos()
            .subscribe(
                onNext: { [weak self] videos in
                    guard let self = self else { return }
                    self._videos.accept(videos)
                })
            .disposed(by:bag)
    }
}
