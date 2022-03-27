//
//  dummyVideoModel.swift
//  VideoPlayerTests
//
//  Created by user on 2022/03/28.
//

import Foundation
import XCTest
@testable import VideoPlayer

struct DummyDataModel {
    static let dummyVideoModel1: VideoModel =  VideoModel(
        title: "G12 Chemistry",
        presenterName: "Kaoru Sakata",
        description: "90 seconds exercise for Chemistry",
        thumbnailUrl: "https://quipper.github.io/native-technical-exam/images/sakata.jpg",
        videoUrl: "https://quipper.github.io/native-technical-exam/videos/sakata.mp4",
        videoDuration: 97000
    )
    
    static let dummyVideoModel2: VideoModel =  VideoModel(
        title: "G12 Japanese Classics",
        presenterName: "Rina Okamoto",
        description: "90 seconds exercise for Japanese Classics",
        thumbnailUrl: "https://quipper.github.io/native-technical-exam/images/okamoto.jpg",
        videoUrl: "https://quipper.github.io/native-technical-exam/videos/okamoto.mp4",
        videoDuration: 75000
    )
    
    static let dummyVideoModel3: VideoModel =  VideoModel(
        title: "G12 English",
        presenterName: "Masao Seki",
        description: "90 seconds exercise for English",
        thumbnailUrl: "https://quipper.github.io/native-technical-exam/images/seki.jpg",
        videoUrl: "https://quipper.github.io/native-technical-exam/videos/seki.mp4",
        videoDuration: 86000
    )
    
    static let dummyVideoModel4: VideoModel =  VideoModel(
        title: "G12 Math",
        presenterName: "Keisuke Yamauchi",
        description: "90 seconds exercise for Math",
        thumbnailUrl: "https://quipper.github.io/native-technical-exam/images/yamauchi.jpg",
        videoUrl: "https://quipper.github.io/native-technical-exam/videos/yamauchi.mp4",
        videoDuration: 105000
    )
    
    static let dummyVideoModel5: VideoModel =  VideoModel(
        title: "G12 Japanese History",
        presenterName: "Gaichi Ito",
        description: "90 seconds exercise for Japanese History",
        thumbnailUrl: "https://quipper.github.io/native-technical-exam/images/ito.jpg",
        videoUrl: "https://quipper.github.io/native-technical-exam/videos/ito.mp4",
        videoDuration: 104000
    )
    
    static let dummyVideoModels: [VideoModel] = [
        dummyVideoModel1,
        dummyVideoModel2,
        dummyVideoModel3,
        dummyVideoModel4,
        dummyVideoModel5
    ]
}


