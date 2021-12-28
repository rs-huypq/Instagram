//
//  LoginView.swift
//  Instagram
//
//  Created by Quang Huy on 07/12/2021.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var loginViewModel = LoginViewModel()
    
    var buildBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [.purple, .blue]),
            startPoint: .top,
            endPoint: .bottom
        ).edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $loginViewModel.isLoading) {
                VStack(spacing: 20) {
                    // Logo
                    Image(AppImages.instagramLogoWhite).padding(.bottom, 20)
                    
                    // Text field for email
                    IGTextField(
                        placeholder: AppStrings.emailPlaceholderLogin,
                        message: loginViewModel.emailMessage,
                        type: TypeInput.email,
                        text: $loginViewModel.email
                    )
                    
                    // Text field for password
                    IGTextField(
                        placeholder: AppStrings.passwordPlaceholderLogin,
                        message: loginViewModel.passwordMessage,
                        type: TypeInput.password,
                        text: $loginViewModel.password
                    )
                    
                    // Login button
                    IGButton(
                        label: AppStrings.loginButton,
                        actionButton: {
                            loginViewModel.createSession()
                        },
                        disable: loginViewModel.isValid,
                        destinationView: AnyView(DashboardView()),
                        isActiveNavigate: $loginViewModel.isSuccess
                    )
                    
                    // Forgot password button
                    IGLetterButton(
                        title: AppStrings.forgotPasswordTitle,
                        label: AppStrings.forgotPasswordButton,
                        destination: AnyView(Text(AppStrings.forgotPasswordTitle)),
                        actionButton: {}
                    )
                    
                    Spacer()
                    
                    // Sign up button
                    IGLetterButton(
                        title: AppStrings.signUpTitle,
                        label: AppStrings.signUpButton,
                        destination: AnyView(SignUpView()),
                        actionButton: {}
                    )
                    
                }
                .padding()
                .background(buildBackground)
                .navigationBarHidden(true)
            }
        }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
#endif
