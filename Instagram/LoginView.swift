//
//  LoginView.swift
//  Instagram
//
//  Created by Quang Huy on 07/12/2021.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Logo
                Image("Instagram_logo_white")
                    .padding(.bottom, 20)
                
                // Text field for email
                TextField(
                    "Email",
                    text: $email
                )
                    .padding()
                    .foregroundColor(.white)
                    .background(.white.opacity(0.3))
                
                // Text field for password
                SecureField(
                    "Password",
                    text: $password
                )
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.3))
                
                // Login button
                Button(action: {}) {
                    NavigationLink(destination: DashboardView()) {
                        Text("Log In")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(.purple.opacity(0.4))
                            .cornerRadius(12)
                            .padding(.bottom, 10)
                    }
                    .navigationBarHidden(true)
                }
                
                // Forgot password button
                OtherButton(title: "Forgot your password?", labelButton: "Get help signing in.")
                
                Spacer()
                
                // Sign up button
                OtherButton(title: "Don't have an account?", labelButton: "Sign up")
                
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
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

struct OtherButton: View {
    var title: String
    var labelButton: String
    
    var body: some View {
        return HStack {
            Text(title)
                .foregroundColor(.white)
            Button(action: {}) {
                NavigationLink(destination: Text("TEST")) {
                    Text(labelButton)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}
