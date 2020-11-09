//
//  NetworkManager.swift
//  Github Folower
//
//  Created by MAC on 11/8/20.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private var urlComponent = URLComponents()
    private let scheme = "https"
    private let host = "api.github.com"
    var numberOfFollowersPerPage = 100
    
    
    private init (){
        urlComponent.scheme = scheme
        urlComponent.host = host
    }
    
    
    
    func getFollowers(for username:String, page:Int, completed: @escaping([Follower]?, ErrorMessage?)->Void) {
        urlComponent.path = "/users/\(username)/followers"
        let perPage = URLQueryItem(name: "per_page", value: String(numberOfFollowersPerPage))
        let pageNumber = URLQueryItem(name: "page", value: String(page))
        urlComponent.queryItems = [perPage, pageNumber]
        guard let url = urlComponent.url else {
            completed(nil,.invalidUsername)
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error{
                completed(nil, .unableToComplete)
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(nil, .invalidResponse)
                return
            }
            guard let data = data else{
                completed(nil,.invalidData)
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            }catch{
                completed(nil,.invalidData)
            }
        }
        task.resume()
    }
}
