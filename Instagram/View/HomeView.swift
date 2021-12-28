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
            _buildTopHome()
            ScrollView {
                _buildStory(users: homeViewModel.listUser)
                Divider()
                _buildPosts(users: homeViewModel.listUser)
            }
        }
    }
}

func _buildTopHome() -> some View {
    return HStack (spacing: 18) {
        Image(AppImages.instagramLogoWhite)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.black)
            .frame(width: 120, height: 40)
        
        Spacer()
        
        Image(systemName: AppImages.plus).resizable().frame(width: 22.0, height: 22.0)
        
        Image(systemName: AppImages.paperplane).resizable().frame(width: 22.0, height: 22.0)
    }
    .padding(.horizontal, 16)
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
