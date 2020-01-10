//
//  NetworkController.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/9/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class NetworkController {
    private let baseURL = URL(string: "https://rayfoodiefun.herokuapp.com/api")!
    var bearer: Bearer?
    static let shared = NetworkController()
    
    // MARK: - AUTH/Sign Up
    func signUpNewUser(user: User, completion: @escaping (NetworkError?) -> Void) {
        let signUpURL = baseURL
            .appendingPathComponent("auth")
            .appendingPathComponent("register")
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let userData = try JSONEncoder().encode(user)
            request.httpBody = userData
        } catch {
            NSLog("Error encoding user: \(error)")
        }
        
        print("Starting session")
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error occured with URLSession: \(error)")
                completion(.otherError)
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("URL Response Status code is not 200. Status code is: \(response.statusCode)")
            }
            
            completion(nil)
        }.resume()
    }
    
    // MARK: - AUTH/Log in
    func logIn(with user: User, completion: @escaping (NetworkError?) -> Void) {
        let signInURL = baseURL
            .appendingPathComponent("auth")
            .appendingPathComponent("login")
        
        var request = URLRequest(url: signInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.otherError)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Status code not 200. Status code is \(response.statusCode)")
                completion(.badAuth)
            }
            
            if let error = error {
                NSLog("Error with URLSession on line \(#line) in \(#file): \(error)")
                completion(.otherError)
                return
            }
            
            guard let data = data else {
                NSLog("Error retreiving data back during logIn URLSession")
                completion(.badData)
                return
            }
            
            do {
                self.bearer = try JSONDecoder().decode(Bearer.self, from: data)
            } catch {
                completion(.noDecode)
                return
            }
            
            completion(nil)
        }.resume()
    }
}
