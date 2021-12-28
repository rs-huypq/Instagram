//
//  ContentView.swift
//  Instagram
//
//  Created by Quang Huy on 07/12/2021.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    
    @State var gridLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
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
                    LazyVGrid(columns: gridLayout, spacing: 1) {
                        ForEach(viewModel.listPhoto) { photo in
                            Image(photo.name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 130)
                                .cornerRadius(0)
                        }
                    }
                    .padding(.horizontal, 1)
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
