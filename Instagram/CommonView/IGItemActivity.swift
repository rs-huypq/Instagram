//
//  IGItemActivity.swift
//  Instagram
//
//  Created by Quang Huy on 29/12/2021.
//

import SwiftUI

struct IGItemActivity: View {
    var activityModel: Activity
    
    var body: some View {
        HStack(alignment: .center) {
            Image(activityModel.userAvatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(activityModel.content)
                .font(.system(size: 13))
            +
            Text(" \(activityModel.time)" + "h")
                .font(.system(size: 12))
                .fontWeight(.thin)
            
            Spacer()
            
            switch activityModel.type {
            case .likeYourImage:
                buildImageLiked(image: activityModel.userAvatar)
            case .followMe:
                buildFollowing()
            case .followRequest:
                buildFollowRequest()
            }
        }
        .padding(.horizontal, 10)
    }
}

func buildImageLiked(image: String) -> some View {
    return Image(image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 40, height: 40)
        .cornerRadius(8)
}

func buildFollowing() -> some View {
    return Text("Following")
        .frame(width: 70, height: 20)
        .font(.system(size: 12))
        .background(.gray.opacity(0.2))
        .cornerRadius(4)
}

func buildFollowRequest() -> some View {
    return HStack {
        Button(action: {}) {
            Text("Confirm")
                .frame(width: 55, height: 20)
                .font(.system(size: 12))
                .background(.blue.opacity(0.2))
                .cornerRadius(4)
        }
        Button(action: {}) {
            Text("Delete")
                .frame(width: 50, height: 20)
                .font(.system(size: 12))
                .foregroundColor(.gray.opacity(0.8))
                .background(.black.opacity(0.2))
                .cornerRadius(4)
        }
    }
}
