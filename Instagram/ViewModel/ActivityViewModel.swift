//
//  ActivityViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 29/12/2021.
//

import Foundation

class ActivityViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var listActivity: [Activity] = [Activity]()
    
    func loadImage() {
        isLoading = true
        listActivity.append(contentsOf: [
            Activity(userAvatar: "thor", content: "Thor liked your post.", time: Int.random(in: 1...24), type: ActivityType.likeYourImage),
            Activity(userAvatar: "caption", content: "cr.ronaldo liked your post.", time: Int.random(in: 1...24), type: ActivityType.likeYourImage),
            Activity(userAvatar: "spider-man", content: "neymar.ir and gullit_cm started following you.",
                     time: Int.random(in: 1...24), type: ActivityType.followMe),
            Activity(userAvatar: "hulk", content: "cr.ronaldo liked your post.", time: Int.random(in: 1...24), type: ActivityType.likeYourImage),
            Activity(userAvatar: "venom-7", content: "Jonhny Dang want follow you?", time: Int.random(in: 1...24), type: ActivityType.followRequest),
            Activity(userAvatar: "caption", content: "cr.ronaldo and messi_30 started following you.",
                     time: Int.random(in: 1...24), type: ActivityType.followMe)
        ])
        isLoading = false
    }
    
    init() {
        loadImage()
    }
}
