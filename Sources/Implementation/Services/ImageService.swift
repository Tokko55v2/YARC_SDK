//
//  ImageService.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//

import Alamofire
import Combine

internal struct ImageService {
    func loadImage(_ url: URL) -> AnyPublisher<ImageResponse, AFError> {
        Deferred {
            Future { promise in
                AF.request(url)
                    .validate()
                    .responseData { response in
                        switch response.result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(data):
                            promise(.success(ImageResponse(image: data)))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
