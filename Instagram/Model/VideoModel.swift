//
//  VideoModel.swift
//  Instagram
//
//  Created by Quang Huy on 28/12/2021.
//

import Foundation
import AVKit

struct Video: Identifiable {
    var id = UUID()
    var player: AVPlayer
    var replay : Bool
    var userName: String
    var userAvatar: String
    var content: String
    var liked: Int
    var comment: Int
}
