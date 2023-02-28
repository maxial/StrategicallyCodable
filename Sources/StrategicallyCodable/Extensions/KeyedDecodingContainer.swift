//
//  KeyedDecodingContainer.swift
//  
//
//  Created by Maxim Aliev on 26.02.2023.
//

import Foundation

extension KeyedDecodingContainer {
    
    public func decode<T>(
        _ type: T.Type,
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> T where T: Decodable, T: OptionalStrategyUsing {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
    
    public func decode<T>(
        _ type: T.Type,
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> T where T: Decodable, T: AnyImmutable, T.T: OptionalStrategyUsing {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: T.T(wrappedValue: nil))
    }
}
