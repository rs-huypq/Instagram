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
        if textFieldValidatorEmail(value: text, type: type) {
            
            isEmailValid = true
        } else {
            isEmailValid = false
        }
    }
    
    func textFieldValidatorEmail(value: String, type: TypeInput) -> Bool {
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        switch type {
        case TypeInput.email:
            
            return emailPredicate.evaluate(with: value)
            
        case TypeInput.password:
            
            return value.count > 5
        case .text:
            
            return true
        }
    }
}
