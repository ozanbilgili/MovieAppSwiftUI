//
//  FavoriteMovieView.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI

struct FavoriteMoviesView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.favorites, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    HStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 150)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.releaseDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }.navigationTitle("Favorite Movies")
                }
            }
        }
    }
}

