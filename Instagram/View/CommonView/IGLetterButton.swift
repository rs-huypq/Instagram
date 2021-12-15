//
//  IGLetterButton.swift
//  Instagram
//
//  Created by Quang Huy on 15/12/2021.
//

import SwiftUI

struct IGLetterButton: View {
    var title: String
    var label: String
    var destination: AnyView
    var actionButton: () -> Void
    
    var body: some View {
        return HStack {
            // Title
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.white)
            
            // Button
            Button(action: actionButton) {
                NavigationLink(destination: destination) {
                    Text(label)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
