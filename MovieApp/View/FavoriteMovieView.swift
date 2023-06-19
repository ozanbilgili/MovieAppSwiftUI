//
//  FavoriteMovieView.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI
import CoreData

struct FavoriteMoviesView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    @FetchRequest(sortDescriptors: []) var movieData: FetchedResults<MovieData>
    
    var body: some View {
        List {
            ForEach(movieData, id: \.self) { movieData in
                NavigationLink(destination: MovieDetailView(movie: movieData.toMovieResult())) {
                    HStack {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieData.posterPath ?? "")")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 150)
                        .cornerRadius(10)
                    
                        VStack(alignment: .leading) {
                            Text(movieData.title ?? "")
                                .font(.headline)
                            Text(movieData.releaseDate ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorite Movies")
    }
}

extension MovieData {
    func toMovieResult() -> Movie.Result {
        return Movie.Result(adult: self.adult, backdropPath: self.backdropPath ?? "", genreIDS: [], id: Int(self.id), originalLanguage: self.originalLanguage ?? "", originalTitle: self.originalTitle ?? "", overview: self.overview ?? "", popularity: self.popularity, posterPath: self.posterPath ?? "", releaseDate: self.releaseDate ?? "", title: self.title ?? "", video: self.video, voteAverage: self.voteAverage, voteCount: self.voteCount)
    }
}




