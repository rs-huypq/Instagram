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
    let placeholder: String
    var type: TypeInput = TypeInput.text
    
    @State private var isEmailValid : Bool = true
    @Binding var text: String
    
    var body: some View {
        
        VStack(alignment: .leading)  {
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.leading)
                }
                
                if type == .password {
                    
                    SecureField(
                        "",
                        text: self.$text
                    )
                        .onChange(of: text, perform: onChanged)
                        .padding()
                        .colorMultiply(.white)
                        .background(.white.opacity(0.2))
                        .foregroundColor(.white)
                } else {
                    
                    TextField(
                        "",
                        text: self.$text
                    )
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onChange(of: text, perform: onChanged)
                        .padding()
                        .colorMultiply(.white)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(Color.white)
                }
                
                
            }
            
            if !isEmailValid {
                
                switch type {
                case TypeInput.email:
                    
                    Text("Email is Not Valid")
                        .foregroundColor(Color.red)
                case TypeInput.password:
                    
                    Text("Password minimum 6 characters")
                        .foregroundColor(Color.red)
                case .text:
                    
                    EmptyView()
                }
            }
        }
    }
    
    func onChanged(value:String) {
        //        if textFieldValidatorEmail(value: self.text, type: self.type) {
        //
        //            self.isEmailValid = true
        //        } else {
        //            self.isEmailValid = false
        //        }
    }
}
