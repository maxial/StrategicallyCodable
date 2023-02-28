//
//  StrategicallyCodableTests.swift
//
//
//  Created by Maxim Aliev on 24.01.2023.
//

import XCTest
@testable import StrategicallyCodable

final class StrategicallyCodableTests: XCTestCase {
    
    private let song = createSong()
    
    func testEncoding() throws {
        let data = try JSONEncoder().encode(song)
        let decodedSong = try JSONDecoder().decode(Song.self, from: data)
        
        try check(decodedSong: decodedSong)
    }
    
    func testDecoding() throws {
        let songJson = """
        { \
            "name": "\(song.name)", \
            "previewUrl": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a", \
            "artworkUrl": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a", \
            "trackViewUrl": "", \
            "artistViewUrl": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a", \
            "releaseDate": "2012-08-20T07:00:00Z" \
        }
        """
        let jsonData = songJson.data(using: .utf8)!
        let decodedSong = try JSONDecoder().decode(Song.self, from: jsonData)
        
        try check(decodedSong: decodedSong)
    }
    
    func testErrorDecoding() throws {
        let songJson = """
        { \
            "name": "\(song.name)", \
            "previewUrl": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a", \
            "releaseDate": "2012-08-20T07:00:00Z", \
            "albumReleaseDate": "2012-08-20T07:00:00" \
        }
        """
        let jsonData = songJson.data(using: .utf8)!
        let decodedSong = try JSONDecoder().decode(Song.self, from: jsonData)
        
        XCTAssertEqual(decodedSong.albumReleaseDate, nil)
    }
    
    private func check(decodedSong: Song) throws {
        XCTAssertEqual(decodedSong.name, song.name)
        XCTAssertEqual(decodedSong.previewUrl, song.previewUrl)
        XCTAssertEqual(decodedSong.artworkUrl, song.artworkUrl)
        XCTAssertEqual(decodedSong.trackViewUrl, nil)
        XCTAssertEqual(decodedSong.artistViewUrl, song.artistViewUrl)
        XCTAssertEqual(decodedSong.releaseDate, song.releaseDate)
    }
    
    private static func createSong() -> Song {
        return Song(
            name: "Supermassive Black Hole",
            previewUrl: URL(string: """
            https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/\
            9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a
            """
            )!,
            artworkUrl: URL(string: """
            https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/\
            9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a
            """
            )!,
            artistViewUrl: URL(string: """
            https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/9e/b2/ef/\
            9eb2efcb-089f-de0b-2760-7445a7f6a460/mzaf_9130440162525707874.plus.aac.p.m4a
            """
            )!,
            releaseDate: createDate()
        )
    }
    
    private static func createDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2012
        dateComponents.month = 8
        dateComponents.day = 20
        dateComponents.hour = 7
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.nanosecond = 0
        dateComponents.timeZone = TimeZone(abbreviation: "UTC")
        return Calendar.current.date(from: dateComponents) ?? .now
    }
}
