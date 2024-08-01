//
//  DataType.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

enum DataType {
    case nation
    case states
    
    var url: URL? {
        switch self {
        case .nation:
            return URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population&year=latest")
        case .states:
            return URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest")
        }
    }
}
