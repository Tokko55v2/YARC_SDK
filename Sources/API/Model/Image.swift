//
//  Image.swift
//
//
//  Created by Michael Kroneder on 18/04/2021.
//

import Foundation

public struct ImageRequest {
    internal let url: String

    public init(url: String) {
        self.url = url
    }
}

public struct ImageResponse {
    public let image: Data

    public init(image: Data) {
        self.image = image
    }
}
