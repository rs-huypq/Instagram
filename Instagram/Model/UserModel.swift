//
//  UserModel.swift
//  Instagram
//
//  Created by Quang Huy on 22/12/2021.
//

import Foundation

class UserModel: Identifiable {
    var name: String = ""
    var avatar: String = ""
    var photo: Photo
    var like : Int = 0
    var status: String = ""
    
    init (name: String, avatar: String, photo: Photo, like: Int, status: String) {
        self.name = name
        self.avatar = avatar
        self.photo = photo
        self.like = like
        self.status = status
    }
}
