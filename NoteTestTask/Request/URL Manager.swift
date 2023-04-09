//
//  URL Manager.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 10.04.2023.
//

import Foundation

class Request {
    static let shated = Request()
    
    private init () {}
    
    func request(handler: @escaping (Result?, Error?) -> Void) {
        let urlString = "https://zenquotes.io/api/today"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                handler(nil,error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Result.self, from: data)
                handler(result, nil)
            }
            catch {
                handler(nil, error)
            }
        }.resume()
    }
}
