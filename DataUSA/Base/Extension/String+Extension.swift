//
//  String+Extension.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import Foundation

extension String {
    func localizableString() -> String {
        NSLocalizedString(self, comment: "")
    }
}
