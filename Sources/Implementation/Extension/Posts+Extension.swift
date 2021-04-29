//
//  Posts+Extension.swift
//
//
//  Created by Michael Kroneder on 18/04/2021.
//

import Foundation

extension Posts: Decodable {
    enum CodingKeys: String, CodingKey {
        case posts = "children"
        case data
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        posts = try data.decode([Post].self, forKey: .posts)
    }
}
