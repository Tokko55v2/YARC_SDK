//
//  ImageService.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//
import Combine
import Foundation

internal struct ImageService {
    func loadImage(_ url: URL) -> AnyPublisher<ImageResponse, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { ImageResponse(image: $0.data) }
            .eraseToAnyPublisher()
    }
}
