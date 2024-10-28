//
//  RecipeModel.swift
//  Recipe
//
//  Created by Maha Salem Alghmadi on 25/04/1446 AH.
//

import Foundation
import PhotosUI

struct Ingredient: Identifiable {
    let id = UUID()
    var name: String
    var measurement: String
    var serving: Int
}

struct Recipe: Identifiable {
    let id: UUID = .init()
    let name: String
    var image: UIImage?
    let description: String
    var ingredients: [Ingredient]  // Array to store ingredients
}

