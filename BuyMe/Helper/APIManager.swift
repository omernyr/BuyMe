
import UIKit

typealias Handler = (Result<[Product], DataError>) -> Void

enum DataError: Error {
    case invalidResponse
    case invaildURL
    case invalidDecoding
    case message(_ error: Error?)
    case network(Error?)
}

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts(handler: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            handler(.failure(.invaildURL))
            return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                handler(.failure(.network(error)))
                return }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                handler(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                handler(.success(products))
            } catch {
                handler(.failure(.network(error)))
            }
        }.resume()
    }
}
