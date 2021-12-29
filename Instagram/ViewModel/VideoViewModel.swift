//
//  VideoViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 28/12/2021.
//

import Foundation
import AVKit
import Combine

class VideoViewModel: ObservableObject {
    @Published var listVideo: [Video] = [Video]()
    
    func getURLPath(source: String) -> URL {
        return URL(fileURLWithPath: Bundle.main.path(forResource: source, ofType: "mp4")!)
    }
    
    func loadVideo() {
        listVideo = [
            Video(
                player: AVPlayer(url: getURLPath(source: "video1")),
                replay: false,
                userName: "Wang Huy",
                userAvatar: "",
                content: "",
                liked: Int.random(in: 0...100),
                comment: Int.random(in: 0...100)
            ),
            Video(
                player: AVPlayer(url: getURLPath(source: "video2")),
                replay: false,
                userName: "",
                userAvatar: "",
                content: "",
                liked: Int.random(in: 0...100),
                comment: Int.random(in: 0...100)
            ),
        ]
    }
    
    init() {
        loadVideo()
    }
}
