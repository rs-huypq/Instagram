//
//  ActivityModel.swift
//  Instagram
//
//  Created by Quang Huy on 29/12/2021.
//

import Foundation
import SwiftUI

enum ActivityType {
    case likeYourImage
    case followMe
    case followRequest
}

struct Activity: Identifiable {
    var id = UUID()
    var userAvatar: String
    var content: String
    var time: Int
    var type: ActivityType
}
