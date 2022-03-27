//
//  VideoService.swift
//  VideoPlayer
//
//  Created by user on 2022/03/27.
//

import Foundation
import RxSwift
import Alamofire

class VideoService {
    static let shared: VideoService = VideoService()
    private lazy var httpService = VideoHttpService()
}

extension VideoService: VideoAPI {
    
    func fetchVideos() -> Observable<VideosResponse> {
        
        return Observable.create { [httpService] (observer) -> Disposable in
            
            do {
                try VideoHttpRouter.getVideos
                    .request(usingHttpService: httpService)
                    .responseJSON { (result) in
                        do {
                            let videos = try VideoService.parseVideos(result)
                            observer.onNext(videos)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                        }
                    }
            } catch {
                observer.onError(CustomError.error(message:"Fetch Failed"))
            }
            return Disposables.create()
        }
    }
}

extension VideoService {
    
    static func parseVideos(_ result: AFDataResponse<Any>) throws -> VideosResponse {
        guard let data = result.data,
              let videosResponse = try? JSONDecoder().decode(VideosResponse.self, from: data)
        else {
            throw CustomError.error(message: "Invalid JSON")
        }
        return videosResponse
    }
}
