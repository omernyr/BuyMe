//
//  APIManager.swift
//  BuyMe
//
//  Created by macbook pro on 15.02.2023.
//

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case messsage(_ error: Error?)
}

import UIKit

typealias Handler = (Result<[Product], DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts(completion: @escaping Handler) {
        
        guard let url = URL(string: Constant.API.productURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            
            guard let data, err == nil else { return }
            completion(.failure(.invalidData))
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

