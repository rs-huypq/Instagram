//
//  DashboardView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct DashboardView: View {
    @State var selectedIndex = 0
    
    let tabBarImage = ["home_selected", "search_selected", "like_selected", "profile_selected"]
    
    let tabBarImageUnSelected = ["home_unselected", "search_unselected", "like_unselected", "profile_unselected"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack (spacing: 18) {
                
                Image("Instagram_logo_white")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .frame(width: 120, height: 40)
                
                Spacer()
                
                Image(systemName: "plus.app").resizable().frame(width: 22.0, height: 22.0)
                
                Image(systemName: "paperplane.fill").resizable().frame(width: 22.0, height: 22.0)
            }
            .padding(.horizontal, 16)
            
            // Divider
            Divider()
            
            ZStack {
                switch selectedIndex {
                case 0:
                    HomeView()
                case 1:
                    Color.blue.opacity(0.5).edgesIgnoringSafeArea(.top)
                case 2:
                    Color.orange.opacity(0.5).edgesIgnoringSafeArea(.top)
                case 3:
                    UserSettingView()

                default:
                    Color.white.edgesIgnoringSafeArea(.top)

                }
            }
            
            // Divider
            Divider()
            
            // Dashboard view
            HStack {
                ForEach (0..<4) { num in
                    Button (action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == selectedIndex {
                            Image(tabBarImage[num])
                        } else {
                            Image(tabBarImageUnSelected[num])
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
