//
//  StrategyUsing.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

public protocol StrategyUsing: Codable {
    associatedtype Strategy: CodingStrategy
    
    var wrappedValue: Strategy.T { get }
    
    init(wrappedValue: Strategy.T)
}

public extension StrategyUsing {
    
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try Strategy.decode(from: decoder))
    }
    
    func encode(to encoder: Encoder) throws {
        try Strategy.encode(value: wrappedValue, to: encoder)
    }
}
