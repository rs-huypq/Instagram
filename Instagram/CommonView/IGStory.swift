//
//  IGStory.swift
//  Instagram
//
//  Created by Quang Huy on 23/12/2021.
//

import SwiftUI

struct IGStory: View {
    var users: [UserModel] = [UserModel]()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(users) { user in
                    VStack {
                        Image(user.avatar)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 68, height: 68)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.red, .purple]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),lineWidth: 3)
                            )
                            .padding(.top, 8)
                            .padding(.horizontal, 12)
                        
                        Text(user.name)
                            .fontWeight(.regular)
                            .font(.system(size: 14))
                    }
                }
            }
        }
    }
}
