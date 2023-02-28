//
//  Immutable.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

public protocol AnyImmutable: Codable {
    associatedtype T: Codable
    
    var wrappedValue: T { get }
    
    init(wrappedValue: T)
}

@propertyWrapper
public struct Immutable<T>: AnyImmutable, Codable where T: Codable {
    
    public let wrappedValue: T
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
    
    public init(from decoder: Decoder) throws {
        self.init(wrappedValue: try T(from: decoder))
    }
}

extension Immutable: OptionalWrapper where T: ExpressibleByNilLiteral { }
