//
//  UrlStrategy.swift
//  
//
//  Created by Maxim Aliev on 08.01.2023.
//

import Foundation

public struct UrlStrategy: CodingStrategy {
    
    public static func decode(from decoder: Decoder) throws -> URL {
        let value = try String(from: decoder)
        guard let url = URL(string: value) else {
            throw DecodingError.valueNotFound(
                self,
                .init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Invalid URL format"
                )
            )
        }
        return url
    }
    
    public static func encode(value: URL, to encoder: Encoder) throws {
        try value.absoluteString.encode(to: encoder)
    }
}
