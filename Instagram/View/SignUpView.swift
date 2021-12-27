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
    
    @State private var image = UIImage(imageLiteralResourceName: AppImages.addPhotoImage)
    @State private var showSheet = false
    
    var body: some View {
        VStack (spacing: 16) {
            // Select image button
            _buildAddImageButton
            
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
                actionButton: {
                    viewModel.createAccount()
                },
                disable: !viewModel.isValid,
                destinationView: AnyView(DashboardView()),
                isActiveNavigate: $viewModel.isSuccess
            )
            
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
    
    var _buildAddImageButton: some View {
        Image(uiImage: self.image)
            .resizable()
            .renderingMode(showSheet ? .original : .template)
            .foregroundColor(.white)
            .cornerRadius(50)
            .frame(width: 150, height: 150)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .onTapGesture {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                
                //  If you wish to take a photo from camera instead:
                // ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
    }
}

#if DEBUG
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
#endif
