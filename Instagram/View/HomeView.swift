//
//  HomeView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct HomeView: View {
    let userName = ["Huy", "Johnny Dang", "Khoa Pug", "Vuong Pham", "Peter", "John", "Black"]
    
    let userAvatar = ["iron-man", "thanos", "thor", "caption", "hulk", "spider-man", "venom-7"]
    
    var body: some View {
        VStack {
            _buildStory(userAvatar: userAvatar, userName: userName)
            _buildPosts(userAvatar: userAvatar, userName: userName)
            Spacer()
        }
    }
}

func _buildStory(userAvatar: [String], userName: [String]) -> some View {
    return ScrollView(.horizontal, showsIndicators: false) {
        HStack() {
            ForEach(0..<userName.count) { users in
                VStack {
                    Image(userAvatar[users])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 68, height: 68)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.purple, lineWidth: 3))
                        .padding(.top, 8)
                        .padding(.horizontal, 12)
                    
                    Text(userName[users])
                }
            }
        }
    }
}

func _buildPosts(userAvatar: [String], userName: [String]) -> some View {
    let randomInt = Int.random(in: 0..<1000)
    
    return ScrollView {
        ForEach(0..<userName.count) { users in
            VStack(alignment: .leading, spacing: 12) {
                // Avatar, name and option post
                HStack {
                    Image(userAvatar[users])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.purple, lineWidth: 2))
                    
                    Text(userName[users])
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.top, 8)
                .padding(.horizontal, 12)
                
                // Image
                Image(userAvatar[users])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                // Action
                HStack(spacing: 18) {
                    Button(action: {}){
                        Image("like_unselected")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                    }
                    Button(action: {}){
                        Image("comment")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                    }
                    Button(action: {}){
                        Image("send2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                    }
                    
                    Spacer()
                    
                    Button(action: {}){
                        Image("ribbon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 18, height: 18)
                    }
                }
                .padding(.horizontal, 12)
                
                // Like count
                HStack {
                    Text("\(randomInt)")
                        .fontWeight(.medium)
                    Text("lượt thích")
                        .fontWeight(.medium)
                }
                .padding(.horizontal, 12)
                
            }
            .padding(.bottom, 24)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
