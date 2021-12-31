//
//  ContentView.swift
//  Instagram
//
//  Created by Quang Huy on 07/12/2021.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            IGTextField(
                placeholder: AppStrings.searchPlaceHolder,
                placeHolderColor: .black,
                background: .gray.opacity(0.4),
                foreground: .black,
                cornerRadius: 12,
                padding: EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14),
                leading: Image(systemName: AppImages.search),
                text: $viewModel.search
            ).padding(.horizontal, 16)
            
            LoadingView(isShowing: $viewModel.isLoading, color: .black) {
                ScrollView {
                    IGGridImage(gridLayout: viewModel.gridLayout, photo: viewModel.listPhoto)
                }
            }
        }
    }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
#endif
