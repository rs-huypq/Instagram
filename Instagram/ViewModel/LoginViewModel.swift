//
//  UserStateController.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import Foundation
import Combine
import Alamofire

@MainActor
class LoginViewModel: ObservableObject {
    
    // Input
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    
    // Output
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false
    @Published var isSuccess = false
    
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
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
            .map { userNameIsValid, passwordIsValid in
                return userNameIsValid && passwordIsValid
            }
            .eraseToAnyPublisher()
    }
    
    func createSession() -> Void {
        self.isLoading = true
        let url = URL(string: AppStrings.apiLogin)!
        
        AF.upload(
            multipartFormData: { multipart in
                multipart.append(self.email.data(using: .utf8)!, withName: "email")
                multipart.append(self.password.data(using: .utf8)!, withName: "password")
            }, to: url)
            .responseDecodable(of: ResultLogin.self) { response in
                switch response.result {
                case .success(let value):
                    debugPrint(value)
                    self.isSuccess = true
                    self.isLoading = false
                case .failure(_):
                    debugPrint("FAILED")
                    self.isSuccess = false
                    self.isLoading = false
                }
            }
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
        
        // Check button
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}
