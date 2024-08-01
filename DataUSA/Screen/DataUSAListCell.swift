//
//  DataUSAListCell.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 01/08/2024.
//

import SwiftUI

struct DataUSAListCell: View {
    let name: String
    let population: Int
    
    var body: some View {
        HStack {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(population)")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    DataUSAListCell(name: "Alabama", population: 305000)
}
