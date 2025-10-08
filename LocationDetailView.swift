//
//  LocationDetailView.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import SwiftUI

struct LocationDetailView: View {
    
    let urlString: String
    @State private var viewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView("Loading Location...")
            case .success:
                if let location = viewModel.location {
                    // display location details
                    VStack(alignment: .leading, spacing: 20) {
                        Text(location.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Divider()
                        
                        DetailRow(label: "Type", value: location.type)
                        DetailRow(label: "Dimension", value: location.dimension)
                                                
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("Location Details")
                }
            case .error(let message):
                Text(message)
            }
        }
        .task {
            // fetch data when view appears
            await viewModel.fetchLocation(from: urlString)
        }
    }
}

