//
//  Movie.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import Foundation

// MARK: - Welcome
struct Movie: Codable, Identifiable {
    let id = UUID()
    var page: Int
    var results: [Result]
    var totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        
        
    }
    
    // MARK: - Result
    struct Result: Codable, Identifiable {
        let adult: Bool
        var backdropPath: String?
        let genreIDS: [Int]
        let id: Int
        let originalLanguage, originalTitle, overview: String
        let popularity: Double
        var posterPath: String
        let releaseDate, title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}




