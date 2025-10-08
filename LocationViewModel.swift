//
//  LocationViewModel.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import Foundation

@MainActor
@Observable
class LocationViewModel {
    
    var viewState: ViewState = .loading
    var location: Location?
    
    // fetches details for a single location from url
    func fetchLocation(from urlString: String) async {
        self.viewState = .loading
        
        guard let url = URL(string: urlString) else{
            self.viewState = .error(message: "Invalid Location URL.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedLocation = try JSONDecoder().decode(Location.self, from: data)
            
            self.location = decodedLocation
            self.viewState = .success
        } catch {
            self.viewState = .error(message : "Failed to load location data.")
        }
    }
}
