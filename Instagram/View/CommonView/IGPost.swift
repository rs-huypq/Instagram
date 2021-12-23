//
//  IGPost.swift
//  Instagram
//
//  Created by Quang Huy on 23/12/2021.
//

import SwiftUI

struct IGPost: View {
    var users: [UserModel] = [UserModel]()
    
    var body: some View {
        ScrollView {
            ForEach(users) { user in
                VStack(alignment: .leading) {
                    // Avatar, name and option post
                    _buildAvatarAndName(avatar: user.avatar, name: user.name)
                    
                    // Image
                    Image(user.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    Group {
                        // Action for Post: Like, Comment, Send and Flag
                        _buildAction()
                        
                        // Like count
                        _buildCountLike(like: user.like)
                        
                        // Content
                        _buildContent(name: user.name, content: user.status)
                    }.padding(.horizontal, 12)
                }
                .padding(.bottom, 24)
            }
        }
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
            Image(systemName: "line.3.horizontal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
                .foregroundColor(.black.opacity(0.8))
        }
        
    }
    .padding(.top, 8)
    .padding(.horizontal, 12)
}

func _buildAction() -> some View {
    return HStack(spacing: 18) {
        Button(action: {}){
            _buildIcon(iconName: "heart")
        }
        Button(action: {}){
            _buildIcon(iconName: "message")
        }
        Button(action: {}){
            _buildIcon(iconName: "paperplane")
        }
        
        Spacer()
        
        Button(action: {}){
            _buildIcon(iconName: "bookmark")
        }
    }
}

func _buildIcon(iconName: String) -> some View {
    return Image(systemName: iconName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 24, height: 24)
        .foregroundColor(.black.opacity(0.8))
}

func _buildCountLike(like: Int) -> some View {
    return HStack(spacing: 4) {
        Text("\(like)")
            .fontWeight(.medium)
            .font(.system(size: 14))
        Text("lượt thích")
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
}
