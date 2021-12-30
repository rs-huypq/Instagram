//
//  DashboardView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct DashboardView: View {
    @State var selectedIndex = 0
    
    let tabBarImage = [AppImages.homeSelected, AppImages.search, AppImages.videoSelected, AppImages.heartFill, AppImages.userSelected]
    
    let tabBarImageUnSelected = [AppImages.home, AppImages.search, AppImages.video, AppImages.heart, AppImages.user]
    
    var body: some View {
        VStack(spacing: 0) {
            switch selectedIndex {
            case 0:
                HomeView()
            case 1:
                SearchView()
            case 2:
                VideoView()
            case 3:
                ActivityView()
            case 4:
                ProfileView()
                
            default:
                Color.white.edgesIgnoringSafeArea(.top)
                
            }
            
            // Divider
            Divider()
            
            // Dashboard view
            HStack {
                ForEach (0..<5) { num in
                    Button (action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()

                        if num == selectedIndex {
                            Image(systemName: tabBarImage[num])
                                .foregroundColor(.black)
                        } else {
                            Image(systemName: tabBarImageUnSelected[num])
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    })
                }
            }
            .padding(.top, 12)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
