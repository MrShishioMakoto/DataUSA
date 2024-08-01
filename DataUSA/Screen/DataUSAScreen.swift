//
//  DataUSAScreen.swift
//  DataUSA
//
//  Created by GoncaloSAlmeida on 31/07/2024.
//

import SwiftUI

struct DataUSAScreen: View {
    @StateObject var viewModel: DataUSAViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section(LocalizableKeys.Section.nation) {
                    if let nations = viewModel.nation?.data {
                        ForEach(nations) { nation in
                            DataUSAListCell(
                                name: nation.name,
                                population: nation.population
                            )
                        }
                    } else {
                        ProgressView()
                    }
                }
                Section(LocalizableKeys.Section.states) {
                    if let states = viewModel.states?.data {
                        ForEach(states) { state in
                            DataUSAListCell(
                                name: state.name,
                                population: state.population
                            )
                        }
                    } else {
                        ProgressView()
                    }
                }
            }
            .navigationTitle(LocalizableKeys.Nav.title)
            .task {
                await viewModel.getInfo()
            }
            .alert(isPresented: $viewModel.hasError, error: viewModel.error) {
                Button(LocalizableKeys.Alert.button) {
                    Task {
                        await viewModel.getInfo()
                    }
                }
            }
        }
    }
}

#Preview {
    DataUSAScreen(viewModel: DataUSAViewModel())
}
