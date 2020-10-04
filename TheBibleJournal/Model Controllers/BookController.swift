//
//  BookController.swift
//  TheBibleJournal
//
//  Created by Cameron Stuart on 10/4/20.
//

import Foundation

class BookController {
    
    static var books: [Book] {
        let genesis = Book(name: "Genesis", chapterCount: 50)
        let exodus = Book(name: "Exodus", chapterCount: 40)
        
        return [genesis, exodus]
    }
}
