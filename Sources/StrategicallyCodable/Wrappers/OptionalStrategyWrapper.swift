//
//  OptionalStrategyWrapper.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

@propertyWrapper
public struct OptionalStrategyWrapper<StrategyWrapper: StrategyUsing>: OptionalStrategyUsing {
    
    public var wrappedValue: StrategyWrapper.Strategy.T?
    
    public init(wrappedValue: StrategyWrapper.Strategy.T?) {
        self.wrappedValue = wrappedValue
    }
}
