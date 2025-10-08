//
//  CharacterDetailView.swift
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

import SwiftUI

// view respondable for details of a charecter
struct CharacterDetailView: View {
    
    let character: Character
    
    var body: some View {
        ScrollView{
            VStack (spacing:20) {
                AsyncImage(url: URL(string: character.image)){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(12)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Details")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // reusable helper view for details in row
                    DetailRow(label: "Status", value: character.status)
                    DetailRow(label: "Species", value: character.species)
                    DetailRow(label: "Gender", value: character.gender)
                    
                    if let originURL = character.origin.url, !originURL.isEmpty {
                        NavigationLink(destination: LocationDetailView(urlString: originURL)) {
                            DetailRow(label: "Origin", value: character.origin.name)
                                    .foregroundColor(.primary)
                        }
                    } else {
                        DetailRow(label: "Origin", value: character.origin.name)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// reusable view component for consistent styling
struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View{
        HStack {
            Text(label)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}
