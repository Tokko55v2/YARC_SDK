//
//  SubReddits+Extension.swift
//
//
//  Created by Michael Kroneder on 18/04/2021.
//

import Foundation

extension SubReddits: Decodable {
    enum CodingKeys: CodingKey {
        case children
        case data
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        subReddits = try data.decode([SubReddit].self, forKey: .children)
    }
}
