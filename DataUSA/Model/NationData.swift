//
//  NationData.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

struct NationData: Codable, Equatable {
    let data: [Nation]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    static func == (lhs: NationData, rhs: NationData) -> Bool {
        lhs.data == rhs.data
    }
    
    init(data: [Nation]) {
        self.data = data
    }
    
    struct Nation: Codable, Identifiable, Equatable {
        let id, name: String
        let population: Int
        
        enum CodingKeys: String, CodingKey {
            case id = "ID Nation"
            case name = "Nation"
            case population = "Population"
        }
        
        static func == (lhs: Nation, rhs: Nation) -> Bool {
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.population == rhs.population
        }
        
        init(id: String, name: String, population: Int) {
            self.id = id
            self.name = name
            self.population = population
        }
    }
}

extension NationData {
 static let dummyData = NationData(
    data: [
        Nation(
            id: "01000US",
            name: "United States",
            population: 331097593
        )
    ]
 )
}
