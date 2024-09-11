//
//  PostListViewModel.swift
//  CombineMVVMUIKitExample
//
//  Created by Louis Macbook on 11/09/2024.
//

import Foundation
import Combine

class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let getPostsUseCase: GetPostsUseCase
    
    init(getPostsUseCase: GetPostsUseCase) {
        self.getPostsUseCase = getPostsUseCase
        fetchPosts()
    }
    
    func fetchPosts() {
        getPostsUseCase.execute()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { posts in
                self.posts = posts
            })
            .store(in: &cancellables)
    }
}
