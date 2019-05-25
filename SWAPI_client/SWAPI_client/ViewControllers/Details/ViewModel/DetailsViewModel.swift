//
//  DetailsViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal class DetailsViewModel: DetailsViewModelType {
    var dataType: DataType = .People
    var data: Any = ""
    
    var sectionsCount: Int {
        return dataSections.count
    }
    
    var dataSections: [String] {
        switch dataType {
        case .People:
            return ["Name", "Birth year", "Eye Color", "Gender", "Hair color", "Height", "Mass", "Skin color", "Homeworld", "Films",
            "Species", "Starships", "Vehicles", "url", "Created", "Edited"]
        case .Films:
            return ["Title", "Episode", "Opening", "Director", "Producer", "Release date", "Species", "Starships", "Vehicles", "Characters", "Planets", "Created", "Edited"]
        case .Planets:
            return ["Title"]
        case .Species:
            return ["Title"]
        case .Starships:
            return ["Title"]
        case .Vehicles:
            return ["Title"]
        }
    }
    
    let controllerTitle = "Details"
    let numberOfRowsInSection: Int = 1
    
    func sectionTitle(for index: Int) -> String {
        return dataSections[index]
    }
    
    func dataForRow(at indexPath: IndexPath) -> String {
        switch dataType {
        case .People:
            guard let person = data as? Person else {
                return ""
            }
            
            let dataArray = [
                person.name,
                person.birth_year,
                person.eye_color,
                person.gender,
                person.hair_color,
                person.height,
                person.mass,
                person.skin_color,
                person.homeworld,
                person.films?.joined(separator: "\n") ?? "",
                person.species?.joined(separator: "\n") ?? "",
                person.starships?.joined(separator: "\n") ?? "",
                person.url,
                person.vehicles?.joined(separator: "\n") ?? "",
                person.created,
                person.edited
            ]
            
            return dataArray[indexPath.section]
        case .Films:
            guard let film = data as? Film else {
                return ""
            }
            
            let dataArray = [
                film.title,
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
                film.edited
            ]
            
            return dataArray[indexPath.section]
        case .Planets:
            return("Planets")
        case .Species:
            return("Species")
        case .Starships:
            return("Starships")
        case .Vehicles:
            return("Vehicles")
        }
    }
}
