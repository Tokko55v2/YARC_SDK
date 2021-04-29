//
//  SubReddit.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//

import Foundation

public struct SubReddit: Identifiable {
    public var id: UUID
    public var subscribers: Int64
    public var display_name: String
    public var title: String
    public var display_name_prefixed: String
    public var subreddit_type: String
    public var over18: Bool
    public var primary_color: String
    public var icon_img: String
    public var public_description: String
    public var banner_background_color: String
    public var url: String
}
