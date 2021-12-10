//
//  UserSettingView.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import SwiftUI

struct UserSettingView: View {
    @EnvironmentObject var state: UserStateViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                Task{
                    await state.signOut()
                }
            } label: {
                Image(systemName:  "rectangle.portrait.and.arrow.right")
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
