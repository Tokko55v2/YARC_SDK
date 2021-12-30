//
//  YarcModule.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//
import Combine

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public protocol YarcModule {
    func getPosts(_ prefix: String) -> AnyPublisher<Posts, YarcError>
    
    func getMostPopularReddits() -> AnyPublisher<SubReddits, YarcError>

    func getImage(imgaeRequest: ImageRequest) -> AnyPublisher<ImageResponse, YarcError>
}
