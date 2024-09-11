//
//  PostRepository.swift
//  CombineMVVMUIKitExample
//
//  Created by Louis Macbook on 11/09/2024.
//

import Foundation
import Combine

protocol PostRepositoryProtocol {
    func getPosts() -> AnyPublisher<[Post], Error>
}

class PostRepository: PostRepositoryProtocol {
    private let postService: PostServiceProtocol
    
    init(postService: PostServiceProtocol) {
        self.postService = postService
    }
    
    func getPosts() -> AnyPublisher<[Post], Error> {
        return postService.fetchPosts()
    }
}
