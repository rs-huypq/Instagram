//
//  IGLoading.swift
//  Instagram
//
//  Created by Quang Huy on 27/12/2021.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var color: Color = .white
    var content: () -> Content

    var body: some View {
        ZStack(alignment: .center) {
            // View
            self.content()
                .disabled(self.isShowing)
                .blur(radius: self.isShowing ? 2 : 0)

            // Loading view
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: color))
                .opacity(self.isShowing ? 1 : 0)
        }
    }

}
