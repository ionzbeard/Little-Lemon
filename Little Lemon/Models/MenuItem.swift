//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Jonathan Cabral on 4/18/24.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    
    var id = UUID()
    let title : String
    let descriptionDish: String
    let price: String
    let image: String
    let category: String
    
enum CodingKeys: String, CodingKey {
    
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
