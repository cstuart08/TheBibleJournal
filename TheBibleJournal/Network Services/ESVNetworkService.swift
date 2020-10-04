//
//  ESVNetworkService.swift
//  TheBibleJournal
//
//  Created by Cameron Stuart on 10/4/20.
//

import Foundation

class ESVNetworkService {
    
    func fetchPassage(book: Book, chapterNumber: Int, completion: @escaping (Result<Chapter, ChapterError>) -> Void) {
        guard let baseURL = URL(string: "https://api.esv.org/v3/passage/text/") else { return completion(.failure(.invalidURL)) }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        let passageQuery = URLQueryItem(name: "q", value: "\(book.name) \(chapterNumber)")
        components?.queryItems = [passageQuery]
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL)) }
        
        var request = URLRequest(url: finalURL)
        let tokenString = "16701c17780fd9661ed1d91aa44abb1b57dbf40b"
        request.addValue("Token \(tokenString)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error)
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noDataFound)) }
            
            do {
                let tld = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let originalPassage = tld.passages[0]
                let mod1Passage = originalPassage.replacingOccurrences(of: "[", with: "")
                let mod2Passage = mod1Passage.replacingOccurrences(of: "]", with: "")
                let chapter = Chapter(number: chapterNumber, text: mod2Passage)
                completion(.success(chapter))
            } catch {
                print(error)
                print(error.localizedDescription)
                completion(.failure(.unableToDecode))
            }
        }.resume()
    }
    
}
