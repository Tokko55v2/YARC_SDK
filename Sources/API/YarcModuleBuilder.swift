//
//  YarcModuleBuilder.swift
//
//
//  Created by Michael Kroneder on 17/04/2021.
//

import Foundation

public struct YarcModuleBuilder {
    public init() {}

    public func build() -> YarcModule {
        YarcModuleImpl()
    }
}
