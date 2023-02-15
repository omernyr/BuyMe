//
//  ProductViewModel.swift
//  BuyMe
//
//  Created by macbook pro on 15.02.2023.
//

import UIKit

final class ProductViewModel {

    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
                
            case .success(let products):
                self.eventHandler?(.dataLoaded)
                print(products)
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
            }
        }
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        
    }
}
