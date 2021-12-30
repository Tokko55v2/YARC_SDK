//
//  YarcModuleImpl.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//
import Combine
import Foundation

internal final class YarcModuleImpl: YarcModule {
    var dataService = DataService()
    var imageService = ImageService()

    public init() {}

    func getImage(imgaeRequest: ImageRequest) -> AnyPublisher<ImageResponse, YarcError> {
        guard let url = URL(string: imgaeRequest.url) else {
            return Fail(error: YarcError.generic("url not valid")).eraseToAnyPublisher()
        }

        return imageService.loadImage(url)
            .mapError { error in YarcError.generic("\(error)") }
            .eraseToAnyPublisher()
    }

    func getMostPopularReddits() -> AnyPublisher<SubReddits, YarcError> {
        dataService.getMostPopularReddits()
            .mapError { error in YarcError.generic("\(error)") }
            .eraseToAnyPublisher()
    }

    func getPosts(_ prefix: String) -> AnyPublisher<Posts, YarcError> {
        dataService.getPosts(prefix)
            .mapError { error in YarcError.generic("\(error)") }
            .eraseToAnyPublisher()
    }
}
