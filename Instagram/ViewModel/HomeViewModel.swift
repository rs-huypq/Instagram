//
//  HomeViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 22/12/2021.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var listUser: [UserModel] = [UserModel]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        let randomInt = Int.random(in: 0..<1000)
        listUser.append(contentsOf: [
            UserModel(name: "Quang Huy", avatar: "iron-man", like: randomInt, status: "opp!"),
            UserModel(name: "Johnny Dang", avatar: "thanos", like: randomInt, status: "Mua coin đi các bạn"),
            UserModel(name: "Khoa Pug", avatar: "thor", like: randomInt, status: "30 tỷ với tôi chỉ là rác..."),
            UserModel(name: "Vuong Pham", avatar: "caption", like: randomInt, status: "Tôi làm gì có tiền mua máy bay"),
            UserModel(name: "Peter Parker", avatar: "spider-man", like: randomInt, status: "Dì May cần tìm chồng, liên hệ Nhện Nhọ"),
            UserModel(name: "John", avatar: "hulk", like: randomInt, status: "Cần mọi người tư vấn cho mình chỗ mua quần áo ở Hà Nội"),
            UserModel(name: "Black", avatar: "venom-7", like: randomInt, status: "Nhện đâu ??")
        ])
    }
}
