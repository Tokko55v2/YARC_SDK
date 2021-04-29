//
//  StringCodableMap.swift
//
//
//  Created by Michael Kroneder on 18/04/2021.
//

import Foundation

internal struct StringCodableMap<Decoded: LosslessStringConvertible>: Codable {
    var decoded: Decoded

    init(_ decoded: Decoded) {
        self.decoded = decoded
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)

        guard let decoded = Decoded(decodedString) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: """
            The string \(decodedString) is not representable as a \(Decoded.self)
            """)
        }

        self.decoded = decoded
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded.description)
    }
}
