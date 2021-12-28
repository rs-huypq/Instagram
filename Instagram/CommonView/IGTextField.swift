//
//  IGTextFieldView.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import SwiftUI

enum TypeInput {
    case email
    case password
    case text
}

struct IGTextField: View {
    var placeholder: String
    var message: String = ""
    var type: TypeInput = TypeInput.text
    var placeHolderColor: Color = .white.opacity(0.8)
    var background: Color = .white.opacity(0.2)
    var foreground: Color = .white
    var cornerRadius: CGFloat = 0
    var padding: EdgeInsets = EdgeInsets(top: 14, leading: 14, bottom: 14, trailing: 14)
    var leading: Image? = nil
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    HStack(spacing: 16) {
                        leading
                        Text(placeholder)
                            .foregroundColor(placeHolderColor)
                    }
                    .padding(.leading)
                }
                
                if type == .password {
                    SecureField(
                        "",
                        text: $text
                    )
                        .padding(padding)
                        .colorMultiply(.white)
                        .background(.white.opacity(0.2))
                        .foregroundColor(.white)
                        .accentColor(.white)
                } else {
                    TextField(
                        "",
                        text: $text
                    )
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(padding)
                        .colorMultiply(.white)
                        .background(background)
                        .foregroundColor(foreground)
                        .accentColor(foreground)
                        .cornerRadius(cornerRadius)
                }
            }
            
            // Show valid
            Text(message)
                .font(.system(size: 16))
                .foregroundColor(.yellow)
        }
    }
}
