//
//  HomeViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 22/12/2021.
//

import Foundation
import Combine
import SwiftUI

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
                UserModel(name: "Wang Huy", avatar: "iron-man", photo: Photo(name: "cafe-1"), like: Int.random(in: 0..<1000), status: "opp!"),
                UserModel(name: "Johnny Dang", avatar: "thanos", photo: Photo(name: "cafe-2"), like: Int.random(in: 0..<1000), status: "Mua coin đi các bạn"),
                UserModel(name: "Khoa Pug", avatar: "thor", photo: Photo(name: "cafe-3"), like: Int.random(in: 0..<1000), status: "30 tỷ với tôi chỉ là rác..."),
                UserModel(name: "Vuong Pham", avatar: "caption", photo: Photo(name: "cafe-4"), like: Int.random(in: 0..<1000), status: "Tôi làm gì có tiền mua máy bay"),
                UserModel(name: "Peter Parker", avatar: "spider-man", photo: Photo(name: "cafe-5"), like: Int.random(in: 0..<1000), status: "Dì May cần tìm chồng, liên hệ Nhện Nhọ"),
                UserModel(name: "John", avatar: "hulk", photo: Photo(name: "cafe-6"), like: Int.random(in: 0..<1000), status: "Khoan cắt bê-tông, xin gọi..."),
                UserModel(name: "Black", avatar: "venom-7", photo: Photo(name: "cafe-7"), like: Int.random(in: 0..<1000), status: "Nhện đâu ??")
            ])
    }
}
