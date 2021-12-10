//
//  InstagramApp.swift
//  Instagram
//
//  Created by Quang Huy on 07/12/2021.
//

import SwiftUI

@main
struct InstagramApp: App {
    @StateObject var userStateViewModel = UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            ApplicationSwitcher().environmentObject(userStateViewModel)
        }
    }
}

struct ApplicationSwitcher: View {
    @EnvironmentObject var state: UserStateViewModel
    
    var body: some View {
        if (state.isLoggedIn) {
            DashboardView()
        } else {
            LoginView()
        }
        
    }
}
