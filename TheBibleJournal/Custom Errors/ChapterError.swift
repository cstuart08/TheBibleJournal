//
//  ChapterError.swift
//  TheBibleJournal
//
//  Created by Cameron Stuart on 10/4/20.
//

import Foundation

enum ChapterError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noDataFound
    case unableToDecode
}
