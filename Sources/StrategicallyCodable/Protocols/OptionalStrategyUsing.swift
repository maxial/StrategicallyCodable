//
//  OptionalStrategyUsing.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

public protocol OptionalStrategyUsing: OptionalWrapper, Codable where T == StrategyWrapper.Strategy.T? {
    associatedtype StrategyWrapper: StrategyUsing
}

public extension OptionalStrategyUsing {
    
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? StrategyWrapper.Strategy.decode(from: decoder))
    }
    
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = wrappedValue {
            try StrategyWrapper.Strategy.encode(value: wrappedValue, to: encoder)
        }
    }
}
