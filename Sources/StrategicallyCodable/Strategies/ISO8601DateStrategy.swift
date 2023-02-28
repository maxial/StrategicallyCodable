//
//  ISO8601DateStrategy.swift
//  
//
//  Created by Maxim Aliev on 24.02.2023.
//

import Foundation

public struct ISO8601DateStrategy: CodingStrategy {
    
    private static let iso8601Formatter = ISO8601DateFormatter()
    
    public static func decode(from decoder: Decoder) throws -> Date {
        let value = try String(from: decoder)
        guard let value = iso8601Formatter.date(from: value) else {
            throw DecodingError.valueNotFound(
                self,
                .init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Invalid date format"
                )
            )
        }
        return value
    }
    
    public static func encode(value: Date, to encoder: Encoder) throws {
        try iso8601Formatter.string(from: value).encode(to: encoder)
    }
}
