//
//  FuncLogin.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 12/30/23.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMess: String)
}

class login {
    struct Response: Codable {
        let token: String?
        let message: String?
        let success: Bool?

    }
    
    func sendLogin(username: String, password: String, Url: String, completion: @escaping (Result<String, AuthenticationError>) -> Void){
        guard let url = URL(string: Url) else {
            completion(.failure(.custom(errorMess: "URL is incorrect")))
            return
        }
        
        var request = URLRequest(url:url)
        
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "username": username,
            "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMess: "Empty")))
                return
            }
            
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = response.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
        }
        task.resume()
    }
}
