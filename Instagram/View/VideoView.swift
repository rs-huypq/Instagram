//
//  VideoView.swift
//  Instagram
//
//  Created by Quang Huy on 28/12/2021.
//

import AVKit
import SwiftUI

struct VideoView: View {
    @State var index = 0
    @State var top = 0
    @ObservedObject private var viewModel = VideoViewModel()
    
    var body: some View {
        ZStack {
            PlayerScrollView(data: $viewModel.listVideo)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
#endif
