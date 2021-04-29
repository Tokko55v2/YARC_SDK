//
//  DataService.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//
import Alamofire
import Combine
import Foundation

internal struct DataService {
    func getMostPopularReddits() -> AnyPublisher<SubReddits, AFError> {
        Deferred {
            Future { promise in
                AF.request(ClientConstants.BASE_URL + ClientConstants.MOST_POPULAR_URL, method: .get)
                    .validate()
                    .responseDecodable(of: SubReddits.self, emptyResponseCodes: [200, 204, 205]) { response in
                        switch response.result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(data):
                            promise(.success(data))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }

    func getPosts(_ prefix: String) -> AnyPublisher<Posts, AFError> {
        Deferred {
            Future { promise in
                AF.request(ClientConstants.BASE_URL + prefix + ClientConstants.JSON, method: .get)
                    .validate()
                    .responseDecodable(of: Posts.self) { response in
                        switch response.result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(data):
                            promise(.success(data))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
