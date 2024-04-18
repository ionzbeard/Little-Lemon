//
//  MenuList.swift
//  Little Lemon
//
//  Created by Jonathan Cabral on 4/18/24.
//

import Foundation

struct MenuList: Codable {
    
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
