//
//  UserSettingView.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import SwiftUI

struct UserSettingView: View {
    @EnvironmentObject var state: LoginViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Button {} label: {
                Text("Log out")
            }
            Spacer()
        }
    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}
