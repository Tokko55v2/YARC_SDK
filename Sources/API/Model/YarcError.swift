//
//  YarcError.swift
//
//
//  Created by Michael Kroneder on 14/04/2021.
//

import Foundation
public enum YarcError: Error {
    case generic(String?)
}

extension YarcError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .generic(.some(error)):
            return error
        default:
            return "An error occured"
        }
    }
}
