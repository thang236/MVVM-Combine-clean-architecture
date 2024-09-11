//
//  GetPostsUseCase.swift
//  CombineMVVMUIKitExample
//
//  Created by Louis Macbook on 11/09/2024.
//

import Foundation
import Combine

class GetPostsUseCase {
    private let postRepository: PostRepositoryProtocol
    
    init(postRepository: PostRepositoryProtocol) {
        self.postRepository = postRepository
    }
    
    func execute() -> AnyPublisher<[Post], Error> {
        return postRepository.getPosts()
    }
}
