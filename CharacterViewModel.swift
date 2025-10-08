//
//  CharacterViewModel.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import Foundation

// enumeration to represent the different states of the view
enum ViewState {
    case loading
    case success
    case error(message: String)
}

@MainActor
@Observable
class CharacterViewModel {
    
    // array of characters fetchd from the API
    var characters: [Character] = []
    
    // current state of the view
    var viewState: ViewState = .loading
    
    // handeling of the cycle: URL creation, data fetching, decoding, and error handling
    func fetchCharacters() async {
        // set initial state to loading
        self.viewState = .loading
        
        // create the URL
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            self.viewState = .error(message: "Invalid URL provided.")
            print("Invalid URL")
            return
        }
        
        // perform the API call
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // validate the HTTP rsponse code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                self.viewState = .error(message: "Failed to fetch data from the server.")
                return
            }
            
            // decode the JSON data onto the Swift model
            let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            // Update properties and state upon success
            self.characters = apiResponse.results
            self.viewState = .success
            
        } catch {
            //robust error handling
            self.viewState = .error(message: "An error ocurred: \(error.localizedDescription)")
            print("Error fetching or decoding data: \(error)")
        }
    }
}
