//
//  Product.swift
//  BuyMe
//
//  Created by macbook pro on 13.02.2023.
//

// MARK: - ProductElement
struct Product: Codable {
    var id: Int?
    var title: String?
    var price: Double?
    var description: String?
    var category: Category?
    var image: String?
    var rating: Rating?
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    var rate: Double?
    var count:  Int?
}
