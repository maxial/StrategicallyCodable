//
//  Song.swift
//  
//
//  Created by Maxim Aliev on 23.02.2023.
//

import Foundation
@testable import StrategicallyCodable

struct Song: Codable {
    
    let name: String
    @Immutable @Apply<UrlStrategy> var previewUrl: URL
    @Immutable @OptionalApply<UrlStrategy> var artworkUrl: URL?
    @Immutable @OptionalApply<UrlStrategy> var trackViewUrl: URL?
    @OptionalApply<UrlStrategy> var artistViewUrl: URL?
    @Apply<ISO8601DateStrategy> var releaseDate: Date
    @OptionalApply<ISO8601DateStrategy> var albumReleaseDate: Date?
}
