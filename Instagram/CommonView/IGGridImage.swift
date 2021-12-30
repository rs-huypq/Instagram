//
//  IGGridImage.swift
//  Instagram
//
//  Created by Quang Huy on 30/12/2021.
//

import SwiftUI

struct IGGridImage: View {
    var gridLayout: [GridItem]
    var photo: [Photo]
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 1) {
            ForEach(photo) { photo in
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
