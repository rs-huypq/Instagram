//
//  ProfileModel.swift
//  Instagram
//
//  Created by Quang Huy on 30/12/2021.
//

import Foundation

struct ProfileModel: Identifiable {
    var id = UUID()
    var userName: String!
    var userAvatar: String!
    var userDescription: String!
    var posts: Int!
    var followers: Int!
    var following: Int!
    var photo: [Photo]!
}
