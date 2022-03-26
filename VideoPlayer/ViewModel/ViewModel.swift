//
//  ViewModel.swift
//  VideoPlayer
//
//  Created by user on 2022/03/21.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class ViewModel {
    
    private let _videos: BehaviorRelay<[Video]> = .init(value: [])
    var videos: Observable<[Video]> { _videos.asObservable() }// 把BehaviorRelay格式转成Observable各式
    var listOfVideos: [Video] {
        return _videos.value
    }
//    var numberOfVideos: Int {
//        return _videos.value.count
//    }
            
    func getVideos() -> Observable<Void> {
        AF.request("https://quipper.github.io/native-technical-exam/playlist.json",
                   method: .get,
                   parameters: nil)
            .responseJSON(completionHandler: { [weak self] response in
                guard let self = self,
                      let data = response.data else { return }
                do {
                    self._videos.accept(try JSONDecoder().decode([Video].self, from: data))
                } catch {
                    print("JSONSerialization error:", error)
                }
                
            })
        return Observable.just(())
    }
    
}
