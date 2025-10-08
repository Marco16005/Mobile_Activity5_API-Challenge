//
//  Character.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import Foundation

// Documents the top level response from the API
struct APIResponse : Decodable {
    let results: [Character]
}

// Conforms to Identifiable for use in SwiftUI List and Decodable for JSON parsing
struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let image: String // URL string for character's image
    
    // maps JSON keys to Swift properties
    enum CodingKeys: String, CodingKey {
        case id, name, status, species, gender, origin, image
    }
}

// Documents the original location of a character
struct Origin: Decodable {
    let name: String
    let url: String?
}
