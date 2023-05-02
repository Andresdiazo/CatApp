//
//  Cat.swift
//  CatApp
//
//  Created by Andres Diaz Orozco on 30/04/23.
//

struct Cat: Decodable {
    let breedName: String?
    let origin: String?
    let affectionLevel: Int?
    let intelligence: Int?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case breedName = "name"
        case origin
        case affectionLevel = "affection_level"
        case intelligence
        case imageUrl = "reference_image_id"
    }
}
