//
//  NetworkError.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

enum NetworkError: LocalizedError {
    case generic
    case invalidUrl
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .generic:
            return LocalizableKeys.NetworkError.generic
        case .invalidUrl:
            return LocalizableKeys.NetworkError.url
        case .failedToDecode:
            return LocalizableKeys.NetworkError.decode
        case .invalidStatusCode:
            return LocalizableKeys.NetworkError.invalid
        }
    }
}
