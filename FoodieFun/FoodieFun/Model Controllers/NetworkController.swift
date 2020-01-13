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
    var restaurants: [Restaurant] = []
    var user: User?
    static let shared = NetworkController()
    
    // MARK: - AUTH/Sign Up
    func signUpNewUser(user: User, completion: @escaping (NetworkError?) -> Void) {
        self.user = user
        
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
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error occured with URLSession: \(error)")
                completion(.otherError)
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                NSLog("URL Response Status code is not 200. Status code is: \(response.statusCode)")
            }
            
            guard let data = data else {
                completion(.badData)
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                self.user = user
            } catch {
                completion(.noDecode)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
    // MARK: - AUTH/Log in
    func logIn(with username: String, password: String, completion: @escaping (NetworkError?) -> Void) {
        let signInURL = baseURL
            .appendingPathComponent("auth")
            .appendingPathComponent("login")
        
        var request = URLRequest(url: signInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        do {
//            let jsonData = try JSONEncoder().encode(user)
//            request.httpBody = jsonData
//        } catch {
//            NSLog("Error encoding user object: \(error)")
//            completion(.otherError)
//            return
//        }
        let json = """
            {
                "username" : "\(username)",
                "password" : "\(password)"
            }
        """
        let jsonData = json.data(using: .utf8)
        request.httpBody = jsonData
        
        
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
                self.user = self.bearer?.user
            } catch {
                completion(.noDecode)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
    func fetchAllRestaurants(completion: @escaping (Result<[Restaurant], NetworkError>) -> Void) {
        guard let bearer = bearer else {
            completion(.failure(.noAuth))
            return
        }
        
        let fetchAllRestaurantsURL = baseURL.appendingPathComponent("restaurants")
        var request = URLRequest(url: fetchAllRestaurantsURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
            response.statusCode == 401 {
                completion(.failure(.badAuth))
                return
            }
            
            if let _ = error {
                completion(.failure(.otherError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            do {
                self.restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                completion(.success(self.restaurants))
                NSLog("Success fetching Restaurants!")
            } catch {
                completion(.failure(.noDecode))
                NSLog("Error Fetching restaurants: \(error)")
                return
            }
        }.resume()
    }
    
    func postNewRestaurant(restaurant: Restaurant, completion: @escaping (NetworkError?) -> Void = { _ in }) {
        guard let bearer = bearer,
            let user = user else {
            completion(.noAuth)
            return
        }
        
        var restaurantPOSTed = restaurant
        restaurantPOSTed.id = user.id
        
        let requestURL = baseURL.appendingPathComponent("restaurants/")
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bearer.token)", forHTTPHeaderField: "Authorization")
        do {
            request.httpBody = try JSONEncoder().encode(restaurantPOSTed)
        } catch {
            NSLog("Error POSTing restaurant on line \(#file) in \(#line): \(error)")
            completion(.otherError)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error POSTing restaurant in dataTask on line \(#line): \(error)")
                completion(.otherError)
            }
            
            if let response = response as? HTTPURLResponse {
                NSLog("response is \(response.statusCode)")
                completion(.badAuth)
            }
            
            completion(nil)
        }.resume()
    }
}
