//
//  Preview.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//

import Foundation
import HTMLString

public struct Preview: Decodable {
    public var source: Source

    enum CodingKeys: CodingKey {
        case source
    }
}

public struct Source: Decodable {
    private var _url: StringCodableMap<String>

    var url: String {
        get { _url.decoded.removingHTMLEntities() }
        set { _url.decoded = newValue }
    }

    var width: Int
    var height: Int

    enum CodingKeys: String, CodingKey {
        case _url = "url"
        case width
        case height
    }
}
