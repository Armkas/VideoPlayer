//
//  VideoDataSource.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import RxSwift

class VideoDataSource: DataSource {
    func getVideos() -> Observable<VideosResponse> {
        return VideoService.shared.fetchVideos()
    }
}
