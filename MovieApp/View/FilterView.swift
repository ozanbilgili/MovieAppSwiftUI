//
//  FilterView.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI
import CoreData

struct FilterView: View {
    @ObservedObject var viewModel: MovieViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    viewModel.selectedGenre = nil
                    viewModel.movie = nil //
                    viewModel.fetchMovies(page: 1)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("See All")
                        .fontWeight(.bold)
                }

                ForEach(genres) { genre in
                    Button(action: {
                        viewModel.movie?.results.removeAll()
                        viewModel.selectedGenre = genre
                        viewModel.fetchMovies(page: 1)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text(genre.name)
                    }
                }
            }
            .navigationTitle("Filter by Genre")
        }
    }
}



