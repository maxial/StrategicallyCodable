//
//  Typealiases.swift
//  
//
//  Created by Maxim Aliev on 28.02.2023.
//

import Foundation

public typealias Apply<S: CodingStrategy> = StrategyWrapper<S>
public typealias OptionalApply<S: CodingStrategy> = OptionalStrategyWrapper<Apply<S>>
