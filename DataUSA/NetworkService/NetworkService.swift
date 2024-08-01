//
//  NetworkService.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(_ dataType: DataType) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T: Decodable>(_ dataType: DataType) async throws -> T {
        guard let url = dataType.url else { throw NetworkError.invalidUrl }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 && httpResponse.statusCode <= 300
        else {
            throw NetworkError.invalidStatusCode
        }
        
        do {
            let decodedInfo = try JSONDecoder().decode(T.self, from: data)
            return decodedInfo
        } catch {
            throw NetworkError.failedToDecode
        }
    }
}
