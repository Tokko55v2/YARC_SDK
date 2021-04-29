//
//  SubReddit+Extension.swift
//
//
//  Created by Michael Kroneder on 18/04/2021.
//

import Foundation

extension SubReddit: Decodable {
    enum CodingKeys: CodingKey {
        case subscribers
        case display_name
        case title
        case display_name_prefixed
        case subreddit_type
        case over18
        case primary_color
        case icon_img
        case public_description
        case banner_background_color
        case url
        case data
    }

    public init(from decoder: Decoder) throws {
        id = UUID()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        subscribers = try dataContainer.decode(Int64.self, forKey: .subscribers)
        display_name = try dataContainer.decode(String.self, forKey: .display_name)
        title = try dataContainer.decode(String.self, forKey: .title)
        display_name_prefixed = try dataContainer.decode(String.self, forKey: .display_name_prefixed)
        subreddit_type = try dataContainer.decode(String.self, forKey: .subreddit_type)
        over18 = try dataContainer.decode(Bool.self, forKey: .over18)

        primary_color = try dataContainer.decode(String.self, forKey: .primary_color)

        do {
            icon_img = try dataContainer.decode(String.self, forKey: .icon_img)
        } catch {
            icon_img = ""
        }

        public_description = try dataContainer.decode(String.self, forKey: .public_description)
        banner_background_color = try dataContainer.decode(String.self, forKey: .banner_background_color)
        url = try dataContainer.decode(String.self, forKey: .url)
    }
}

extension SubReddit: Hashable {
    public static func ==(lhs: SubReddit, rhs: SubReddit) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
