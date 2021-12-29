//
//  ActivityView.swift
//  Instagram
//
//  Created by Quang Huy on 29/12/2021.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject private var viewModel = ActivityViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header Activity
            HStack {
                Text(AppStrings.activity)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                Spacer()
            }
            .padding()
            .background(.gray.opacity(0.1))
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.listActivity) { value in
                        IGItemActivity(activityModel: value)
                    }
                }
            }
            .padding(.top, 10)
        }
    }
}

#if DEBUG
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
#endif
