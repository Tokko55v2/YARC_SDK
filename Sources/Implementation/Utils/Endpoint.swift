//
//  Endpoint.swift
//  
//
//  Created by Michael Kroneder on 30.12.21.
//
import Foundation

struct RedditEndpoint {
    let path: String
    let queryItems: [URLQueryItem]?
    
    init(path: String, queryItems: [URLQueryItem]? = nil) {
        self.path = "/\(path)/.json"
        self.queryItems = queryItems
    }
}

extension RedditEndpoint {
    var url: URL {
        var components: URLComponents = .init()
        components.scheme = "https"
        components.host = "www.reddit.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.nonOptionalURL
    }
}

extension URLComponents {
    var nonOptionalURL: URL {
        guard let url = self.url else {
            preconditionFailure("Invalid URL")
        }
        
        return url
    }
}
