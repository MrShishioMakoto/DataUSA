//
//  MockNetworkService.swift
//  DataUSATests
//
//  Created by GoncaloSAlmeida on 01/08/2024.
//

import Foundation
@testable import DataUSA

class MockNetworkService: NetworkServiceProtocol {
    var fetchDataClosure: ((DataType) async throws -> Decodable)?

    func fetchData<T: Decodable>(_ dataType: DataType) async throws -> T {
        guard let fetchDataClosure = fetchDataClosure else {
            throw NetworkError.generic
        }
        return try await fetchDataClosure(dataType) as! T
    }
}
