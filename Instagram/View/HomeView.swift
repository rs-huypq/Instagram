//
//  HomeView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            _buildStory(users: homeViewModel.listUser)
            _buildPosts(users: homeViewModel.listUser)
        }
    }
}

func _buildStory(users: [UserModel]) -> some View {
    return IGStory(users: users)
}

func _buildPosts(users: [UserModel]) -> some View {    
    return IGPost(users: users)
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
