//
//  SignUpView.swift
//  Instagram
//
//  Created by Quang Huy on 09/12/2021.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack (spacing: 16) {
            
            Image(AppImages.addPhotoImage)
                .renderingMode(.template)
                .foregroundColor(.white)
                .padding()
            
            // Text field for email
            IGTextField(
                placeholder: AppStrings.emailPlaceholderLogin,
                message: viewModel.emailMessage,
                type: TypeInput.email,
                text: $viewModel.email
            )
            
            // Text field for password
            IGTextField(
                placeholder: AppStrings.passwordPlaceholderLogin,
                message: viewModel.passwordMessage,
                type: TypeInput.password,
                text: $viewModel.password
            )
            
            // Text field for full name
            IGTextField(
                placeholder: AppStrings.fullNamePlaceholderSignUp,
                message: viewModel.fullNameMessage,
                type: TypeInput.text,
                text: $viewModel.fullName
            )
            
            // Text field for user name
            IGTextField(
                placeholder: AppStrings.userNamePlaceholderSignUp,
                message: viewModel.userNameMessage,
                type: TypeInput.text,
                text: $viewModel.userName
            )
            
            // Sign Up button
            IGButton(
                label: AppStrings.signUpButton,
                actionButton: {}
            ).disabled(!viewModel.isValid)
            
            Spacer()
            
            // Back to Login screen if have an account
            IGLetterButton(
                title: AppStrings.questionSignUp,
                label: AppStrings.signInButton,
                moveToScreen: false,
                actionButton: {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
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
