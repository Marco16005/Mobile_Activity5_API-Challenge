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
            // state to display the appropriate UI
            switch viewModel.viewState {
            case .loading:
                // shows loading indicator while fetching data
                ProgressView("Fetching Characters...")
                
            case .success:
                // if data loaded succesfully, show the list
                List(viewModel.characters) { character in
                    // each item link to detail view
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterRow(character: character)
                    }
                }
                .navigationTitle("Rick & Morty")
                
            case .error(let message):
                // show error message and retry button if API call fails
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
            // triggers the API call when the view first appears
            await viewModel.fetchCharacters()
        }
        
    }
}

// helper view for each row in the list for organization
struct CharacterRow: View {
    let character: Character
    
    var body: some View {
        HStack (spacing: 16) {
            // asynchronous load of the charsacter image from URL
            AsyncImage (url: URL(string: character.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            } placeholder: {
                // placeholder while image loading
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
