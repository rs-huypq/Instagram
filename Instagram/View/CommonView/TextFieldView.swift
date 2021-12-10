//
//  TextFieldView.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import SwiftUI

struct TextFieldView: View {
    var place
    
    var body: some View {
        return TextField()
            .padding()
            .foregroundColor(.white)
            .background(.white.opacity(0.3))
    }
}
