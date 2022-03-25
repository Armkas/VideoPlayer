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
    var videos = [Video]()
        
    func getData() -> [Video] {
        AF.request("https://quipper.github.io/native-technical-exam/playlist.json",
                   method: .get,
                   parameters: nil)
            .responseJSON(completionHandler: { [weak self] response in
                guard let self = self,
                      let data = response.data else { return }
                do {
                    self.videos = try JSONDecoder().decode([Video].self, from: data)
                } catch {
                    print("JSONSerialization error:", error)
                }
                
            })
        return videos
    }
    
}
