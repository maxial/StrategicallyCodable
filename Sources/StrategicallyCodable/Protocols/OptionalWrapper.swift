//
//  OptionalWrapper.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

public protocol OptionalWrapper {
    associatedtype T: ExpressibleByNilLiteral
    
    var wrappedValue: T { get }
    
    init(wrappedValue: T)
}
