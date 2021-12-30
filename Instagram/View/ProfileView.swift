//
//  UserSettingView.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var viewModel = ProfileViewModel()
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                buildTopProfile(userName: viewModel.profile.userName)
                buildProfile(
                    image: viewModel.profile.userAvatar,
                    posts: viewModel.profile.posts,
                    follower: viewModel.profile.followers,
                    follwing: viewModel.profile.following
                )
                buildDescription(description: viewModel.profile.userDescription)
                buildButtonEdit()
                // Tabs
                IGTopTabView(tabs: viewModel.tabs, geoWidth: geo.size.width, selectedTab: $viewModel.selectedTab)
                ScrollView {
                    IGGridImage(gridLayout: viewModel.gridLayout, photo: viewModel.profile.photo)
                }
            }
        }
    }
}

func buildTopProfile(userName: String) -> some View {
    return HStack(spacing: 18) {
        Text(userName)
            .fontWeight(.bold)
            .font(.system(size: 28))
        
        Spacer()
        
        Button(action: {}) {
            Image(systemName: "slider.horizontal.3")
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(.black)
        }
    }
    .padding()
    .background(.gray.opacity(0.1))
}

func buildProfile(image: String, posts: Int, follower: Int, follwing: Int) -> some View {
    HStack(spacing: 18) {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipShape(Circle())
        
        Spacer()
        
        buildInfoProfile(label: "Posts", value: posts)
        buildInfoProfile(label: "Followers", value: follower)
        buildInfoProfile(label: "Following", value: follwing)
    }
    .padding(.horizontal, 16)
}

func buildInfoProfile(label: String, value: Int) -> some View {
    return VStack(alignment: .center) {
        Text("\(value)")
            .font(.system(size: 16))
            .fontWeight(.bold)
        Text(label)
            .font(.system(size: 14))
            .fontWeight(.regular)
    }
}

func buildDescription(description: String) -> some View {
    return Text(description)
        .font(.system(size: 12))
        .fontWeight(.medium)
        .padding()
}

func buildButtonEdit() -> some View {
    return HStack(spacing: 4) {
        Button(action: {}) {
            Text("Edit Profile")
                .font(.system(size: 14))
                .foregroundColor(.black)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30)
        .border(Color.gray.opacity(0.8), width: 1)
        .cornerRadius(4)
        .padding(.horizontal, 10)
    }
}

#if DEBUG
struct ProfileViewView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
