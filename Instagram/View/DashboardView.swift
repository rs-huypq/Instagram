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
            ZStack {
                switch selectedIndex {
                case 0:
                    HomeView()
                case 1:
                    SearchView()
                case 2:
                    Color.white.opacity(0.5).edgesIgnoringSafeArea(.top)
                case 3:
                    Color.white.opacity(0.5).edgesIgnoringSafeArea(.top)
                case 4:
                    UserSettingView()

                default:
                    Color.white.edgesIgnoringSafeArea(.top)

                }
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
