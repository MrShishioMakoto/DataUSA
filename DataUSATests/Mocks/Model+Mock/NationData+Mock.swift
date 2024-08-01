//
//  Nation+Mock.swift
//  DataUSATests
//
//  Created by GoncaloSAlmeida on 01/08/2024.
//

@testable import DataUSA
import Foundation

extension NationData {
    enum Mock {
        static func makeMock(
            id: String = "01000US",
            name: String = "United States",
            population: Int = 331097593
        ) -> [Nation] {
            return [Nation(id: id, name: name, population: population)]
        }
    }
}
