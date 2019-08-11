//
//  FilmViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class FilmViewModel: DetailsViewModel<Film>, FilmViewModelType {
    var film: Film
    
    init(film: Film) {
        self.film = film
        super.init(controllerTitle: film.title)
        updateSections(for: film)
    }
    
    override var dataSectionTitles: [String] {
        return ["Title:",
                "Number of the episode:",
                "Opening credits:",
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
    
    override func updateSections(for item: Film) {
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
