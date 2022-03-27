//
//  VideoService.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import RxSwift

class VideoService {
    static let shared: VideoService = VideoService()
    private lazy var httpService = VideoHttpService()
}

extension VideoService: VideoAPI {
    
    func fetchVideos() -> Single<VideosResponse> {
        
        return Single.create { [httpService] (single) -> Disposable in
            
            do {
                try VideoHttpRouter.getVideos
                    .request(usingHttpService: httpService)
                    .responseJSON { (result) in
                        guard let data = result.data else { return }
                        do {
                            let videos = try JSONDecoder().decode(VideosResponse.self, from: data)
                            single(.success(videos))
                        } catch {
                           //TODO
                        } 
                    }
            } catch {
                //TODO
            }
            
            return Disposables.create()
        }
    }
    
    
}
