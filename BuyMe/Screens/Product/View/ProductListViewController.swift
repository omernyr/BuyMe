//
//  ProductListViewController.swift
//  BuyMe
//
//  Created by macbook pro on 15.02.2023.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}

extension ProductListViewController {
    
    func configuration() {
        initViewModel()
        observeEvent()
    }
    
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading: break
            case .dataLoaded: break
            case .stopLoading: print(self.viewModel.products)
            case .error(let error):
                print(error!)
            }
        }
    }
}

