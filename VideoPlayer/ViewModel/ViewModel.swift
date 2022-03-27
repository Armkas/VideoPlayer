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
    var videos: Observable<[Video]> { _videos.asObservable() }
    var listOfVideos: [Video] { _videos.value }

    func getVideos() {
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
    }
    
}
