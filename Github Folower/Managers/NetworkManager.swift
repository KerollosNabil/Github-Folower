//
//  NetworkManager.swift
//  Github Folower
//
//  Created by MAC on 11/8/20.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let scheme = "https"
    private let host = "api.github.com"
    var numberOfFollowersPerPage = 100
    let cache = NSCache<NSString, UIImage>()
    
    func getFollowers(for username:String, page:Int, completed: @escaping(Result<[Follower], GFError>)->Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = "/users/\(username)/followers"
        let perPage = URLQueryItem(name: "per_page", value: String(numberOfFollowersPerPage))
        let pageNumber = URLQueryItem(name: "page", value: String(page))
        urlComponent.queryItems = [perPage, pageNumber]
        guard let url = urlComponent.url else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getUser(for username:String, completed: @escaping(Result<User, GFError>)->Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = "/users/\(username)"
        guard let url = urlComponent.url else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    
}
