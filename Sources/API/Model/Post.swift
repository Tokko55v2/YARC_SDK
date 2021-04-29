//
//  Post.swift
//  RedditClient
//
//  Created by Michael Kroneder on 24/01/2021.
//

import Foundation
import HTMLString

public struct Post: Identifiable {
    public var id: String
    public var title: String
    public var author: String
    public var url: String
    public var ups: Int
    public var downs: Int
    public var numComments: Int
    public var permalink: String
    public var created: Double
    public var preview: [Preview]
    public var urlOverridenByDest: String
}
