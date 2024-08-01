//
//  StateData.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

struct StateData: Codable, Equatable {
    let data: [State]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    static func == (lhs: StateData, rhs: StateData) -> Bool {
        lhs.data == rhs.data
    }
    
    init(data: [State]) {
        self.data = data
    }
    
    struct State: Codable, Identifiable, Equatable {
        let id, name: String
        let population: Int
        
        enum CodingKeys: String, CodingKey {
            case id = "ID State"
            case name = "State"
            case population = "Population"
        }
        
        static func == (lhs: State, rhs: State) -> Bool {
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

extension StateData {
 static let dummyData = StateData(
    data: [
        State(
            id: "04000US01",
            name: "Alabama",
            population: 5028092
        )
    ]
 )
}
