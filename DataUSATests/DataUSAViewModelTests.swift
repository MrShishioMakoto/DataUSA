//
//  DataUSAViewModelTests.swift
//  DataUSATests
//
//  Created by GoncaloSAlmeida on 01/08/2024.
//

import XCTest
@testable import DataUSA

final class DataUSAViewModelTests: XCTestCase {
    
    var viewModel: DataUSAViewModel!
    var mockNetworkService: MockNetworkService!
    
    @MainActor
    override func setUpWithError() throws {
        mockNetworkService = MockNetworkService()
        viewModel = DataUSAViewModel(networkService: mockNetworkService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockNetworkService = nil
    }

    @MainActor
    func test_getInfo_success() async {
        // Arrange
        let expectedNationData = NationData(data: NationData.Mock.makeMock())
        let expectedStateData = StateData(data: StateData.Mock.makeMock())
        mockNetworkService.fetchDataClosure = { dataType in
            switch dataType {
            case .nation:
                return expectedNationData
            case .states:
                return expectedStateData
            }
        }
        
        // Act
        await viewModel.getInfo()
        
        // Assert
        XCTAssertEqual(viewModel.nation, expectedNationData)
        XCTAssertEqual(viewModel.states, expectedStateData)
        XCTAssertFalse(viewModel.hasError)
        XCTAssertNil(viewModel.error)
    }
    
    @MainActor
    func test_getInfo_failure() async {
        // Arrange
        let expectedError = NetworkError.invalidUrl
        mockNetworkService.fetchDataClosure = { _ in
            throw expectedError
        }
        
        // Act
        await viewModel.getInfo()
        
        // Assert
        XCTAssertTrue(viewModel.hasError)
        XCTAssertEqual(viewModel.error, expectedError)
    }
}
