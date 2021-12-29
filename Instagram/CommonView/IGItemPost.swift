//
//  IGPost.swift
//  Instagram
//
//  Created by Quang Huy on 23/12/2021.
//

import SwiftUI

struct IGPost: View {
    @ObservedObject private var homeViewModel = HomeViewModel()
    
    var users: [UserModel] = [UserModel]()
    
    var body: some View {
        ForEach(users) { user in
            VStack(alignment: .leading) {
                // Avatar, name and option post
                _buildAvatarAndName(avatar: user.avatar, name: user.name)
                
                // Image
                Image(user.photo.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Group {
                    // Action for Post: Like, Comment, Send and Flag
                    _buildAction(viewModel: homeViewModel)
                    
                    // Like count
                    _buildCountLike(like: user.like)
                    
                    // Content
                    _buildContent(name: user.name, content: user.status)
                    
                    // Time
                    _buildTimePost(time: user.time)
                }
                .padding(.horizontal, 12)
            }
            .padding(.bottom, 24)
        }
    }
    
    func _buildAvatarAndName(avatar: String, name: String) -> some View {
        return HStack {
            Image(avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .clipShape(Circle())
                .overlay(Circle().stroke(.purple, lineWidth: 2))
            
            Text(name)
                .font(.system(size: 16))
                .fontWeight(.medium)
            
            Spacer()
            
            Button(action: {}){
                Image(AppImages.more)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .foregroundColor(.black.opacity(0.8))
            }
            
        }
        .padding(.top, 8)
        .padding(.horizontal, 12)
    }
    
    func _buildAction(viewModel: HomeViewModel) -> some View {
        return HStack(spacing: 18) {
            Button(action: {
                viewModel.like()
            }){
                _buildIcon(
                    iconName: viewModel.liked ? AppImages.heartFill : AppImages.heart,
                    color: viewModel.liked ? .red.opacity(0.8) : .black.opacity(0.8)
                )
            }
            Button(action: {}){
                _buildIcon(iconName: AppImages.bubbleChat)
            }
            Button(action: {}){
                _buildIcon(iconName: AppImages.paperplane)
            }
            
            Spacer()
            
            Button(action: {}){
                _buildIcon(iconName: AppImages.bookmark)
            }
        }
    }
    
    func _buildIcon(iconName: String, color: Color = .black.opacity(0.8)) -> some View {
        return Image(systemName: iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .foregroundColor(color)
    }
    
    func _buildCountLike(like: Int) -> some View {
        return HStack(spacing: 4) {
            Text("\(like)")
                .fontWeight(.medium)
                .font(.system(size: 14))
            Text("liked")
                .fontWeight(.medium)
                .font(.system(size: 14))
        }
    }
    
    func _buildContent(name: String, content: String) -> some View {
        return HStack(spacing: 4) {
            Text(name)
                .fontWeight(.medium)
                .font(.system(size: 14))
            Text(content)
                .fontWeight(.thin)
                .font(.system(size: 14))
        }
        .padding(.bottom, 4)
    }
    
    func _buildTimePost(time: Int) -> some View {
        return Text("\(time) hours ago")
            .fontWeight(.thin)
            .font(.system(size: 12))
    }
}
