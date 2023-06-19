//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Ozan Bilgili on 16.06.2023.
//

import SwiftUI

@main
struct MovieAppApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
