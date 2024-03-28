//
//  SendToken.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 1/9/24.
//

import Foundation

enum TokenError: Error {
    case badToken
    case custom(errorMess: String)
}

class SendToken {
    struct Response: Codable {
        let message: String?
        let success: Bool?
    }
    
    func send(completion: @escaping (Result<String, TokenError>) -> Void) {
        guard let url = URL(string: "PLACEHOLDER") else {
            completion(.failure(.custom(errorMess: "URL is incorrect")))
            return
        }
        
        var request = URLRequest(url:url)
        
        
        request.httpMethod = "POST"
        request.setValue(UserDefaults.standard.string(forKey: "tokenName"), forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMess: "Empty")))
                return
            }
            
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                completion(.failure(.badToken))
                return
            }
            
            guard let message = response.message else {
                completion(.failure(.badToken))
                return
            }
            completion(.success(message))
        }
        task.resume()
    }
}
