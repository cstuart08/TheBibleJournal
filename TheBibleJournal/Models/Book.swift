//
//  Book.swift
//  TheBibleJournal
//
//  Created by Cameron Stuart on 10/4/20.
//

import Foundation

struct Book {
    let name: String
    let chapters: [Chapter]
    let chapterCount: Int
    
    init(name: String, chapters: [Chapter] = [], chapterCount: Int) {
        self.name = name
        self.chapters = chapters
        self.chapterCount = chapterCount
    }
}

struct Chapter {
    let number: Int
    let text: String
}

struct TopLevelDictionary: Codable {
    let passages: [String]
}
