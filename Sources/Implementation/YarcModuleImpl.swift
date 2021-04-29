//
//  YarcModuleImpl.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//

import Alamofire
import Combine
import Foundation

internal final class YarcModuleImpl: YarcModule {
    var dataService = DataService()
    var imageService = ImageService()

    public init() {}

    func dispatchLogin() -> AnyPublisher<Void, YarcError> {
        Deferred {
            Future { _ in
            }
        }
        .eraseToAnyPublisher()
    }

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

    func getSubscribedReddits() -> AnyPublisher<SubReddits, YarcError> {
        Deferred {
            Future { _ in
            }
        }
        .eraseToAnyPublisher()
    }

    func getPosts(_ prefix: String) -> AnyPublisher<Posts, YarcError> {
        dataService.getPosts(prefix)
            .mapError { error in YarcError.generic("\(error)") }
            .eraseToAnyPublisher()
    }

    func getSubReddit() -> AnyPublisher<SubReddit, YarcError> {
        Deferred {
            Future { _ in
            }
        }
        .eraseToAnyPublisher()
    }
}
