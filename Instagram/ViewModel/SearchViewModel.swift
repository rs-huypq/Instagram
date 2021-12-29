//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Quang Huy on 28/12/2021.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var search = ""
    @Published var isLoading = false
    @Published var listPhoto: [Photo] = [Photo]()   
    
    func loadImage() {
        isLoading = true
        listPhoto = (1...6).map { Photo(name: "coffee-\($0)") }
        isLoading = false
    }
    
    init() {
        loadImage()
    }
}
