//
//  UserStateController.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import Foundation
import Combine

@MainActor
class LoginViewModel: ObservableObject {
    
    // Input
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var isLoggedIn = false
    
    // Output
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return self._isValidEmail(email: input)
            }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                return password.count >= 6
            }
            .eraseToAnyPublisher()
    }
    
    func _isValidEmail(email: String) -> Bool {
        let emailRegEx = AppStrings.nameEmailValidate + "@" + AppStrings.domainEmailValidate + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    init() {
        // Initial email validate
        isEmailValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                if self.email.isEmpty {
                    return ""
                }
                
                return valid ? "" : AppStrings.emailValid
            }
            .assign(to: \.emailMessage, on: self)
            .store(in: &cancellableSet)
        
        // Initial password validate
        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                if self.password.isEmpty {
                    return ""
                }
                
                return valid ? "" : AppStrings.emailValid
            }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellableSet)
    }
}
