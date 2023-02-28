//
//  KeyedEncodingContainer.swift
//  
//
//  Created by Maxim Aliev on 26.02.2023.
//

import Foundation

extension KeyedEncodingContainer {
    
    public mutating func encode<T>(
        _ value: T,
        forKey key: KeyedEncodingContainer<K>.Key
    ) throws where T: Encodable, T: OptionalStrategyUsing {
        if case Optional<Any>.none = value.wrappedValue as Any {
            return
        }
        try encodeIfPresent(value, forKey: key)
    }
    
    public mutating func encode<T>(
        _ value: T,
        forKey key: KeyedEncodingContainer<K>.Key
    ) throws where T: Encodable, T: AnyImmutable, T.T: OptionalStrategyUsing {
        if case Optional<Any>.none = value.wrappedValue.wrappedValue as Any {
            return
        }
        try encodeIfPresent(value, forKey: key)
    }
}
