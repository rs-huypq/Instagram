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
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.leading)
                }
                
                if type == .password {
                    SecureField(
                        "",
                        text: $text
                    )
                        .padding()
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
                        .padding()
                        .colorMultiply(.white)
                        .background(.white.opacity(0.2))
                        .foregroundColor(.white)
                        .accentColor(.white)
                }
            }
            
            // Show valid
            Text(message)
                .font(.system(size: 16))
                .foregroundColor(.red)
        }
    }
}
