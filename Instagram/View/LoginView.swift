//
//  LoginView.swift
//  Instagram
//
//  Created by Quang Huy on 07/12/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var state: UserStateViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    private var imageString: String = "Instagram_logo_white"
    
    var body: some View {
        NavigationView {
            if (state.isLoading) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView("Logout...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .foregroundColor(.white.opacity(0.8))
                }
            } else {
                VStack(spacing: 20) {
                    // Logo
                    Image(imageString).padding(.bottom, 20)
                    
                    // Text field for email
                    IGTextField(placeholder: "Email", type: TypeInput.email, text: $email)
                    
                    // Text field for password
                    IGTextField(placeholder: "Password", type: TypeInput.password, text: $password)
                    
                    // Login button
                    Button(action: {
                        Task {
                            await state.signIn(
                                email: email,
                                password: password
                            )
                        }
                    }) {
                        NavigationLink(destination: DashboardView()) {
                            Text("Log In")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(.purple.opacity(0.4))
                                .cornerRadius(12)
                                .padding(.bottom, 10)
                        }
                    }
                    
                    // Forgot password button
                    OtherLoginButton(title: "Forgot your password?", labelButton: "Get help signing in.",
                                viewDestination: AnyView(Text("Forgot your password?")))
                    
                    Spacer()
                    
                    // Sign up button
                    OtherLoginButton(title: "Don't have an account?", labelButton: "Sign up",
                                viewDestination: AnyView(SignUpView()))
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                .navigationBarHidden(true)
            }
        }
    }
}



struct OtherLoginButton: View {
    var title: String
    var labelButton: String
    var viewDestination: AnyView
    var actionButton: Void? = nil
    
    var body: some View {
        return HStack {
            Text(title).foregroundColor(.white)
            Button(action: {
                actionButton
            }) {
                NavigationLink(destination: viewDestination) {
                    Text(labelButton)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
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
