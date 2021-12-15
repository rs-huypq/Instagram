//
//  IGButton.swift
//  Instagram
//
//  Created by Quang Huy on 14/12/2021.
//

import SwiftUI

struct IGButton: View {
    var label: String
    var color: Color = .purple.opacity(0.4)
    var cornerRadius: CGFloat = 12
    var actionButton: () -> Void
    
    var body: some View {
        Button(action: actionButton) {
            Text(AppStrings.loginButton)
                .font(.system(size: 16))
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(cornerRadius)
    }
}
