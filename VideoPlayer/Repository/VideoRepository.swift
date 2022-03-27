//
//  VideoRepository.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import RxSwift

class VideoRepository: Repository {
    private let dataSource = VideoDataSource()

    func getVideos() -> Observable<VideosResponse> {
        return self.dataSource.getVideos()
    }
}
