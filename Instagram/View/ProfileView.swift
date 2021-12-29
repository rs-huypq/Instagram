//
//  UserSettingView.swift
//  Instagram
//
//  Created by Quang Huy on 10/12/2021.
//

import SwiftUI

struct UserSettingView: View {
    @ObservedObject var viewModel = LoginViewModel()
        let buttonWidth = (UIScreen.main.bounds.width - 80) / 2
        
        var body: some View {
            LoadingView(isShowing: $viewModel.isLoading) {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("HUY")
                        Spacer()
//                        HStack(alignment: .center, spacing: 20) {
//                            NavigationLink(destination: CommunicateView()) {
//                                Image(Images.plus_unselected.rawValue)
//                                    .resizable()
//                                    .aspectRatio(1, contentMode: .fit)
//                                    .frame(width: 30, height: 30)
//                            }
//                            NavigationLink(destination: SignInView(), isActive: $viewModel.isActiveNavigate) {
//                                Button(action: viewModel.logout) {
//                                    Image(Images.list.rawValue)
//                                        .resizable()
//                                        .renderingMode(.template)
//                                        .foregroundColor(.gray)
//                                        .aspectRatio(1, contentMode: .fit)
//                                        .frame(width: 30, height: 28)
//                                }
//                            }
//                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Image(AppImages.user)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                                    .scaledToFill()
                                
                                Spacer()
//                                ForEach(followingData) { value in
//                                    FollowItem(numberFollow: value.followNumber, followType: value.followType)
//                                }
                            }
                            .padding(.bottom, 20)
//                            ListInfomationItem(info1: Strings.info1.rawValue, info2: Strings.info2.rawValue, info3: Strings.info3.rawValue, info4: Strings.info4.rawValue, info5: Strings.info5.rawValue, info6: Strings.info6.rawValue)
                            
                            HStack(alignment: .center) {
                                ButtonText(action: actionButton, buttonWidth: buttonWidth, buttonText: "")
                                Spacer()
                                ButtonText(action: actionButton, buttonWidth: buttonWidth, buttonText: "" )
                            }
                            HStack(alignment: .center) {
//                                ButtonImage(action: actionButton, image: Images.plus_unselected.rawValue)
                                Spacer()
//                                ButtonImage(action: actionButton, image: Images.film.rawValue)
                                Spacer()
//                                ButtonImage(action: actionButton, image: Images.profile.rawValue)
                            }
                            .padding(.horizontal, 60)
                            .padding(.vertical, 10)
                            
                        }
                        .padding(.horizontal, 10)
//                        ImageGrid(numberOfImage: 20)
                    }
                }
            }
        }
        func actionButton() {
            print("as")
        }

}

struct FollowItem: View {
    var numberFollow: String
    var followType: String
    var body: some View {
        VStack {
            Text(numberFollow)
                .font(.headline)
            Text(followType)
                .font(.system(size: 15))
        }
        .padding(.horizontal, 10)
    }
}

struct ListInfomationItem: View {
    var info1: String
    var info2: String
    var info3: String
    var info4: String
    var info5: String
    var info6: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(info1)
            Text(info2)
            Text(info3)
            Text(info4)
            Text(info5)
            Text(info6)
        }
        .padding(.horizontal, 15)
    }
}

struct ButtonText: View {
    var action: () -> Void
    var buttonWidth: Double
    var buttonText: String
    var body: some View {
        Button(action: action, label: {
            Text(buttonText)
                .frame(width: buttonWidth, height: 30)
                .foregroundColor(.black)
                .border(Color.gray, width: 1)
                .cornerRadius(1)
                .padding(.horizontal, 10)
        })
    }
}


struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}
