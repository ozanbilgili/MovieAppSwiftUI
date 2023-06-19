//
//  DataController.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Movie")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                    print("Error CoreData")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
        } catch{
            print("err")
        }
    }
    func saveData(adult: Bool,  originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, backdropPath: String, id: Int64, genreIDS: [Int], voteCount: Int64, context: NSManagedObjectContext){
        
        let movieData = MovieData(context: context)
        movieData.adult = adult
        movieData.originalLanguage = originalLanguage
        movieData.originalTitle = originalTitle
        movieData.overview = overview
        movieData.popularity = popularity
        movieData.posterPath = posterPath
        movieData.releaseDate = releaseDate
        movieData.title = title
        movieData.video = video
        movieData.voteAverage = voteAverage
        movieData.backdropPath = backdropPath
        movieData.id = id
        movieData.genreIDS = NSArray(array: genreIDS)
        movieData.voteCount = voteCount
        
        
        
        
        save(context: context)
    }
}
