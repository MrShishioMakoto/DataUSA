//
//  DataUSAViewModel.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation
import Combine

@MainActor
class DataUSAViewModel: ObservableObject {
    @Published var states: StateData?
    @Published var nation: NationData?
    
    @Published var error: NetworkError?
    @Published var hasError = false
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getInfo() async {
        do {
            async let nation: NationData = networkService.fetchData(.nation)
            async let states: StateData = networkService.fetchData(.states)
            self.nation = try await nation
            self.states = try await states
        } catch let error {
            self.hasError = true
            self.error = error as? NetworkError
        }
    }
}
