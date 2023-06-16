//
//  Genre.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import Foundation

struct Genre: Identifiable {
    let id = UUID()
    let categoryId: Int
    let name: String
}

let genres: [Genre] = [
    Genre(categoryId: 28, name: "Action"),
    Genre(categoryId: 12, name: "Adventure"),
    Genre(categoryId: 16, name: "Animation"),
    Genre(categoryId: 80, name: "Comedy"),
    Genre(categoryId: 99, name: "Crime"),
    Genre(categoryId: 18, name: "Documentary"),
    Genre(categoryId: 10751, name: "Drama"),
    Genre(categoryId: 314, name: "Family"),
    Genre(categoryId: 36, name: "History"),
    Genre(categoryId: 27, name: "Horror"),
    Genre(categoryId: 10402, name: "Music"),
    Genre(categoryId: 9648, name: "Mystery"),
    Genre(categoryId: 10749, name: "Romance"),
    Genre(categoryId: 868, name: "Science Fic"),
    Genre(categoryId: 10770, name: "TV Movie"),
    Genre(categoryId: 53, name: "Thriller"),
    Genre(categoryId: 10752, name: "War"),
    Genre(categoryId: 37, name: "Western"),
]
