//
//  StrategyWrapper.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

@propertyWrapper
public struct StrategyWrapper<Strategy: CodingStrategy>: StrategyUsing {
    
    public var wrappedValue: Strategy.T
    
    public init(wrappedValue: Strategy.T) {
        self.wrappedValue = wrappedValue
    }
}
