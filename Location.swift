//
//  Location.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import Foundation

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
}
