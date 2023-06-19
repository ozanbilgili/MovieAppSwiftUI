//
//  ContentView.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @StateObject var viewModel = MovieViewModel()
    @State private var showingFilter = false
    

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    if let movie = viewModel.movie {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                                ForEach(movie.results.indices, id: \.self) { index in
                                    NavigationLink(destination: MovieDetailView(movie: movie.results[index])) {
                                        VStack {
                                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.results[index].posterPath)")) { image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .scaledToFit()
                                            .cornerRadius(10)
                                            .padding(10)

                                            Text(movie.results[index].title)
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                            Text(movie.results[index].releaseDate)
                                                .font(.title3)
                                                .foregroundColor(.secondary)
                                        }
                                        .onAppear {
                                            viewModel.loadMoreContentIfNeeded(currentItem: movie.results[index])
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                .navigationTitle("Movies App")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingFilter = true
                        }) {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                        }
                    }
                }
                .sheet(isPresented: $showingFilter) {
                    FilterView(viewModel: viewModel)
                }
            }
            .tabItem {
                Image(systemName: "film")
                Text("Movies")
            }
            .environmentObject(viewModel)
            
            FavoriteMoviesView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
