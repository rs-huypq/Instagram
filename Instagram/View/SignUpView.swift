//
//  SignUpView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var userName: String = ""
    
    var body: some View {
        VStack (spacing: 16) {
            
            Image("plus_photo")
                .renderingMode(.template)
                .foregroundColor(.white)
                .padding()
            
            // Text field for email
            IGTextField(placeholder: "Email", type: TypeInput.email, text: $email)
            
            // Text field for password
            IGTextField(placeholder: "Password", type: TypeInput.password, text: $password)
            
            // Text field for full name
            IGTextField(placeholder: "Full name", type: TypeInput.text, text: $fullName)
            
            // Text field for user name
            IGTextField(placeholder: "User name", type: TypeInput.text, text: $userName)
            
            // Sign Up button
            Button(action: {}) {
                Text("Sign Up")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(.purple.opacity(0.4))
            .cornerRadius(12)
            .padding(.bottom, 10)
            
            Spacer()
            
            // Back to Login screen if have an account
            HStack {
                Text("Already have an account?").foregroundColor(.white)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Sign In")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
            }
            
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
