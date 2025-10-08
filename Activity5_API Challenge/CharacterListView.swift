//
//  CharacterListView.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import SwiftUI

struct CharacterListView: View {
    
    // private instance of the view model
    @State private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView("Fetching Characters...")
                
            case .success:
                List(viewModel.characters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterRow(character: character)
                    }
                }
                .navigationTitle("Rick & Morty")
                
            case .error(let message):
                VStack (spacing: 20){
                    Image(systemName: "wifi.exclamationmark")
                        .font(.largeTitle)
                    Text(message)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Button("Try Again") {
                        Task {
                            await viewModel.fetchCharacters()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .task {
            await viewModel.fetchCharacters()
        }
        
    }
}

struct CharacterRow: View {
    let character: Character
    
    var body: some View {
        HStack (spacing: 16) {
            AsyncImage (url: URL(string: character.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
            }
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CharacterListView()
}
