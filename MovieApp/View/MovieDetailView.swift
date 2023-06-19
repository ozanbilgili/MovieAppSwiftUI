//
//  DetailView.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI
import CoreData

struct MovieDetailView: View {
    
    @EnvironmentObject var viewModel: MovieViewModel
    @Environment(\.managedObjectContext) var moc
    
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
                
                HStack{
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    if movie.adult {
                        Image(systemName:  "18.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Image(systemName: "figure.2.and.child.holdinghands")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if viewModel.favorites.contains(where: { $0.id == movie.id }) {
                        // viewModel.removeFavorite(movie)
                        print("remove")
                    } else {
                        viewModel.addFavorite(movie)
                        DataController().saveData(adult: movie.adult, originalLanguage: movie.originalLanguage, originalTitle: movie.originalTitle, overview: movie.overview, popularity: movie.popularity, posterPath: movie.posterPath, releaseDate: movie.releaseDate, title: movie.title, video: movie.video, voteAverage: movie.voteAverage, backdropPath: movie.backdropPath, id: Int64(movie.id), genreIDS: movie.genreIDS, voteCount: movie.voteCount, context: moc)
                    }
                    
                }) {
                    Image(systemName: viewModel.favorites.contains(where: { $0.id == movie.id }) ? "star.fill" : "star")
                    
                }
            }
        }
    }
    
    
}
