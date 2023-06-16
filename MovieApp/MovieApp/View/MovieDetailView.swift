//
//  DetailView.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie.Result
 
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(movie.posterPath)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .cornerRadius(10)
                
             Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    
                Text("Release Date: " + movie.releaseDate)
                    .font(.title2)
                    .padding(.top)
                
                Text("Overview")
                    .font(.headline)
                    .padding(.top)
                
                Text(movie.overview)
                    .font(.body)
                
            }
            .padding()
        }
        .navigationTitle(movie.originalTitle)
    }
}


