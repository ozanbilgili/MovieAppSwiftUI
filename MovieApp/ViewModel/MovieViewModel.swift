//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import Foundation

//97e39c58399da2856414c4aaba6eebb3 API KEY

class MovieViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var selectedGenre: Genre?
    
    private var currentPage: Int = 1
    private var totalPages: Int = 1
    
    private let base_url = "https://api.themoviedb.org/3/movie/popular?api_key=97e39c58399da2856414c4aaba6eebb3"
    
    init() {
        fetchMovies(page: currentPage)
    }
    
    func fetchMovies(page: Int) {
        
        guard page <= totalPages else { return }
        
        var urlString = base_url + "&page=\(page)"
        
        if let genre = selectedGenre {
            urlString += "&with_genres=\(genre.categoryId)"
            
            print(urlString)
        }
        
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let movieData = data {
                    let decodedData = try JSONDecoder().decode(Movie.self, from: movieData)
                    DispatchQueue.main.async {
                        self.currentPage = decodedData.page
                        self.totalPages = decodedData.totalPages
                        if self.movie != nil {
                            self.movie?.results.append(contentsOf: decodedData.results)
                        } else {
                            self.movie = decodedData
                        }
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    func loadMoreContentIfNeeded(currentItem: Movie.Result?) {
        guard let currentItem = currentItem else {
            fetchMovies(page: currentPage + 1)
            return
        }
        
        let thresholdIndex = movie?.results.index(movie?.results.endIndex ?? 0, offsetBy: -5) ?? 0
        if movie?.results.firstIndex(where: { $0.id == currentItem.id }) == thresholdIndex {
            fetchMovies(page: currentPage + 1)
        }
    }
}
