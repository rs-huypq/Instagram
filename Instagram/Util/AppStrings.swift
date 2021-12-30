//
//  StringApp.swift
//  Instagram
//
//  Created by Quang Huy on 13/12/2021.
//

import Foundation

class AppStrings {
    
    // MARK: API
    static let apiLogin = "https://run.mocky.io/v3/603ceccd-84fc-4d0d-89a3-f40140e729f4"
    static let apiSignUp = "https://run.mocky.io/v3/255afa3f-ffb8-4d97-8bc2-2dc397d611dc"
    
    // MARK: Validate
    static let nameEmailValidate = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    static let domainEmailValidate = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    
    // MARK: Login screen
    static let emailPlaceholderLogin = "Email"
    static let passwordPlaceholderLogin = "Password"
    static let loginButton = "Log In"
    static let forgotPasswordTitle = "Forgot your password?"
    static let forgotPasswordButton = "Get help signing in."
    static let signUpTitle = "Don't have an account?"
    static let signUpButton = "Sign Up"
    static let emailValid = "Email is not Valid"
    static let passwordValid = "Password is not Valid"
    static let fullNameValid = "Full name is empty"
    static let userNameValid = "User name is empty"
    
    // MARK: Sign Up screen
    static let fullNamePlaceholderSignUp = "Full name"
    static let userNamePlaceholderSignUp = "User name"
    static let questionSignUp = "Already have an account?"
    static let signInButton = "Sign In"
    
    // MARK: Search
    static let searchPlaceHolder = "Search"
    
    // MARK: Reels
    static let reelsHeader = "Reels"
    
    // MARK: Activity
    static let activity = "Activity"
}
