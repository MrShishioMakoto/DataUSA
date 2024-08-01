//
//  NetworkServiceTests.swift
//  DataUSATests
//
//  Created by GoncaloSAlmeida on 01/08/2024.
//

import XCTest
@testable import DataUSA

final class NetworkServiceTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        MockUrlProtocol.testData = nil
        MockUrlProtocol.response = nil
        MockUrlProtocol.error = nil
    }
    
    func test_fetchNationData_success() async throws {
        // Arrange
        let networkService = NetworkService(urlSession: createMockURLSession())
        MockUrlProtocol.response = HTTPURLResponse(url: URL(string: DataType.nation.url!.absoluteString)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Act
        let nation: NationData = try await networkService.fetchData(.nation)
        
        // Assert
        XCTAssertNotNil(nation.data)
    }
    
    func test_fetchStatesData_success() async throws {
        // Arrange
        let networkService = NetworkService(urlSession: createMockURLSession())
        MockUrlProtocol.response = HTTPURLResponse(url: URL(string: DataType.states.url!.absoluteString)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Act
        let states: StateData = try await networkService.fetchData(.states)
        
        // Assert
        XCTAssertNotNil(states.data)
    }
}

extension NetworkServiceTests {
    func createMockURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockUrlProtocol.self]
        return URLSession(configuration: configuration)
    }
}
