//
//  FilmViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class FilmViewModel: FilmViewModelType {
    var controllerTitle: String
    
    var dataArray = [String]()
    
    let numberOfRowsInSection: Int = 1
    
    var sectionsCount: Int {
        return dataSectionTitles.count
    }
    
    var film: Film
    
    init(film: Film) {
        self.film = film
        self.controllerTitle = film.title
        updateSections(for: film)
    }
}

extension FilmViewModel {
    var dataSectionTitles: [String] {
        return ["Title:",
                "Episode:",
                "Opening:",
                "Director:",
                "Producer:",
                "Release date:",
                "Species:",
                "Starships:",
                "Vehicles:",
                "Characters:",
                "Planets:",
                "Created:",
                "Edited:"]
    }
}

extension FilmViewModel {
    func dataForRow(at indexPath: IndexPath) -> String {
        return dataArray[indexPath.section]
    }
    
    func sectionTitle(for index: Int) -> String {
        return dataSectionTitles[index]
    }
    
    func updateSections(for film: Film) {
        dataArray = [film.title,
                     String(film.episode_id),
                     film.opening_crawl,
                     film.director,
                     film.producer,
                     film.release_date,
                     film.species.joined(separator: "\n"),
                     film.starships.joined(separator: "\n"),
                     film.vehicles.joined(separator: "\n"),
                     film.characters.joined(separator: "\n"),
                     film.planets.joined(separator: "\n"),
                     film.created,
                     film.edited]
    }
}
