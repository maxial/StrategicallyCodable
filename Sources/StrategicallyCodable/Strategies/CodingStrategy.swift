//
//  CodingStrategy.swift
//  
//
//  Created by Maxim Aliev on 27.02.2023.
//

import Foundation

public protocol CodingStrategy {
    associatedtype T: Codable
    
    static func decode(from decoder: Decoder) throws -> T
    static func encode(value: T, to encoder: Encoder) throws
}
