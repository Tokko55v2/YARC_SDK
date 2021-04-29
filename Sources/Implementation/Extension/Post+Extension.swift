//
//  Post+Extension.swift
//
//
//  Created by Michael Kroneder on 18/04/2021.
//

import Foundation

extension Post: Decodable {
    enum CodingKeys: CodingKey {
        case id
        case title
        case author
        case url
        case ups
        case downs
        case num_comments
        case permalink
        case created
        case url_overridden_by_dest
        case images
        case preview
        case data
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
        author = try dataContainer.decode(String.self, forKey: .author)
        url = try dataContainer.decode(String.self, forKey: .url)
        ups = try dataContainer.decode(Int.self, forKey: .ups)
        downs = try dataContainer.decode(Int.self, forKey: .downs)
        numComments = try dataContainer.decode(Int.self, forKey: .num_comments)
        permalink = try dataContainer.decode(String.self, forKey: .permalink)
        created = try dataContainer.decode(Double.self, forKey: .created)

        do {
            urlOverridenByDest = try dataContainer.decode(String.self, forKey: .url_overridden_by_dest)
        } catch {
            print("no url for dest are found")
        }

        do {
            let previewData = try dataContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .preview)
            preview = try previewData.decode([Preview].self, forKey: .images)
        } catch {
            print("no preview found")
        }
    }
}
