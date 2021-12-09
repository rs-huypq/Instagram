//
//  HomeView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Instagram")
                .font(Font.custom("Victor-Mono", size: 50.0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
