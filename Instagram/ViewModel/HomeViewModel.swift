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
    @Published var liked: Bool = false
    @Published var listUser: [UserModel] = [UserModel]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isLiked: AnyPublisher<Bool, Never> {
        $liked
            .debounce(for: 0.5, scheduler: RunLoop.current)
            .removeDuplicates()
            .map { like in
                return !like
            }
            .eraseToAnyPublisher()
    }
    
    func like() {
        isLiked
            .assign(to: \.liked, on: self)
            .store(in: &cancellableSet)
    }
    
    init() {
        // Mock data for Post
        listUser.append(contentsOf: [
            UserModel(name: "Quang Huy", avatar: "iron-man", like: Int.random(in: 0..<1000), status: "opp!"),
            UserModel(name: "Johnny Dang", avatar: "thanos", like: Int.random(in: 0..<1000), status: "Mua coin đi các bạn"),
            UserModel(name: "Khoa Pug", avatar: "thor", like: Int.random(in: 0..<1000), status: "30 tỷ với tôi chỉ là rác..."),
            UserModel(name: "Vuong Pham", avatar: "caption", like: Int.random(in: 0..<1000), status: "Tôi làm gì có tiền mua máy bay"),
            UserModel(name: "Peter Parker", avatar: "spider-man", like: Int.random(in: 0..<1000), status: "Dì May cần tìm chồng, liên hệ Nhện Nhọ"),
            UserModel(name: "John", avatar: "hulk", like: Int.random(in: 0..<1000), status: "Cần mọi người tư vấn cho mình chỗ mua quần áo ở Hà Nội"),
            UserModel(name: "Black", avatar: "venom-7", like: Int.random(in: 0..<1000), status: "Nhện đâu ??")
        ])
        
    }
}
