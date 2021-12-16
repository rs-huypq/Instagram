//
//  SignUpViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 16/12/2021.
//

import Foundation
import Combine
import Alamofire

@MainActor
class SignUpViewModel: ObservableObject {
    
    // Input
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    // Output
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var fullNameMessage = ""
    @Published var userNameMessage = ""
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
    
    private var isFullNameValidPublisher: AnyPublisher<Bool, Never> {
        $fullName
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { fullName in
                return fullName.count >= 1
            }
            .eraseToAnyPublisher()
    }
    
    private var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { userName in
                return userName.count >= 1
            }
            .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(isEmailValidPublisher, isPasswordValidPublisher, isFullNameValidPublisher, isUserNameValidPublisher)
            .map { userNameIsValid, passwordIsValid, fullNameIsValid, userNameIsValid in
                return userNameIsValid && passwordIsValid && fullNameIsValid && userNameIsValid
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
                
                return valid ? "" : AppStrings.passwordValid
            }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellableSet)
        
        // Initial full name validate
        isFullNameValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                if self.fullName.isEmpty {
                    return ""
                }
                
                return valid ? "" : AppStrings.fullNameValid
            }
            .assign(to: \.fullNameMessage, on: self)
            .store(in: &cancellableSet)
        
        // Initial user name validate
        isUserNameValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                if self.userName.isEmpty {
                    return ""
                }
                
                return valid ? "" : AppStrings.userNameValid
            }
            .assign(to: \.userNameMessage, on: self)
            .store(in: &cancellableSet)
        
        // Check button
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}
