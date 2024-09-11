//
//  PostService.swift
//  CombineMVVMUIKitExample
//
//  Created by Louis Macbook on 11/09/2024.
//

import Foundation
import Combine

protocol PostServiceProtocol {
    func fetchPosts() -> AnyPublisher<[Post], Error>
}

class PostService: PostServiceProtocol {
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
