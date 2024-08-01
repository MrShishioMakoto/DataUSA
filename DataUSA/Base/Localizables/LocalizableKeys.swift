//
//  LocalizableKeys.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

enum LocalizableKeys {
    enum Nav {
        static let title = "navigation.title".localizableString()
    }
    
    enum Section {
        static let nation = "section.nation".localizableString()
        static let states = "section.states".localizableString()
    }
    
    enum NetworkError {
        static let generic = "network.error.invalid.generic".localizableString()
        static let url = "network.error.invalid.url".localizableString()
        static let decode = "network.error.failed.to.decode".localizableString()
        static let invalid = "network.error.invalid.status.code".localizableString()
    }
    
    enum Alert {
        static let button = "alert.button".localizableString()
    }
}
