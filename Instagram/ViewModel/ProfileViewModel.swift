//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 30/12/2021.
//

import Foundation
import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: ProfileModel = ProfileModel()
    @Published var selectedTab: Int = 0
    @Published var gridLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    @Published var tabs: [Tab] = [
        .init(icon: Image(systemName: "rectangle.split.3x3"), title: "Image"),
        .init(icon: Image(systemName: "film.fill"), title: "Movies")
    ]
    
    func loadProfile() {
        profile = ProfileModel(
            userName: "Wang Huy", userAvatar: "iron-man",
            userDescription: "1 2 3 5... Thanos có đánh rơi nhịp nào không 🧐",
            posts: Int.random(in: 0...1000), followers: Int.random(in: 0...100000), following: Int.random(in: 0...1000),
            photo: (1...3).map { Photo(name: "cafe-\($0)") }
        )
    }
    
    init() {
        loadProfile()
    }
}
