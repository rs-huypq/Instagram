//
//  UserStateController.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import Foundation

enum UserStateError: Error{
    case signInError, signOutError
}

@MainActor
class UserStateViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var isLoggedIn = false
    
    func signIn(email: String, password: String) async -> Result<Bool, UserStateError>  {
        isLoading = true
        do{
            try await Task.sleep(nanoseconds:  1_000_000_000)
            isLoggedIn = true
            isLoading = false
            return .success(true)
        }catch{
            isLoading = false
            return .failure(.signInError)
        }
    }
    
    func signOut() async -> Result<Bool, UserStateError>  {
        isLoading = true
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
            isLoggedIn = false
            isLoading = false
            return .success(true)
        }catch{
            isLoading = false
            return .failure(.signOutError)
        }
    }
}
