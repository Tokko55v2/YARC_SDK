//
//  DataService.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//
import Combine
import Foundation

internal struct DataService {
    func getMostPopularReddits() -> AnyPublisher<SubReddits, Error> {
        URLSession.shared.dataTaskPublisher(for: RedditEndpoint(path: "subreddits").url)
            .map { $0.data }
            .decode(type: SubReddits.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getPosts(_ prefix: String) -> AnyPublisher<Posts, Error> {
        URLSession.shared.dataTaskPublisher(for: RedditEndpoint(path: prefix).url)
            .map { $0.data }
            .decode(type: Posts.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
