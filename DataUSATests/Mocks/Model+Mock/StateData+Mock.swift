//
//  StateData+Mock.swift
//  DataUSATests
//
//  Created by GoncaloSAlmeida on 01/08/2024.
//

@testable import DataUSA
import Foundation

extension StateData {
    enum Mock {
        static func makeMock(
            id: String? = nil,
            name: String? = nil,
            population: Int? = nil
        ) -> [State] {
            return [
                State(id: "04000US01", name: "Alabama", population: 5028092),
                State(id: "04000US02", name: "Alaska", population: 734821),
                State(id: "04000US06", name: "California", population: 39356104)
            ]
        }
    }
}
