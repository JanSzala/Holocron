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
    var dataArray = [String]()
    
    let controllerTitle = "Details"
    let numberOfRowsInSection: Int = 1
    
    var sectionsCount: Int {
        return dataSectionTitles.count
    }
    
    var data: Any = "" {
        didSet {
            switch dataType {
            case .People:
                guard let person = data as? Person else {
                    return
                }
                
                dataArray = [
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
                    person.vehicles?.joined(separator: "\n") ?? "",
                    person.created,
                    person.edited
                ]
            case .Films:
                guard let film = data as? Film else {
                    return
                }
                
                dataArray = [
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
            case .Planets:
                guard let planet = data as? Planet else {
                    return
                }
                
                dataArray = [
                    planet.name,
                    planet.diameter,
                    planet.rotation_period,
                    planet.orbital_period,
                    planet.gravity,
                    planet.population,
                    planet.climate,
                    planet.terrain,
                    planet.surface_water,
                    planet.residents.joined(separator: "\n"),
                    planet.films.joined(separator: "\n"),
                    planet.created,
                    planet.edited
                ]
            case .Species:
                guard let kind = data as? Kind else {
                    return
                }
                
                dataArray = [
                    kind.name,
                    kind.classification,
                    kind.designation,
                    kind.average_height,
                    kind.average_lifespan,
                    kind.eye_colors,
                    kind.hair_colors,
                    kind.skin_colors,
                    kind.language,
                    kind.people.joined(separator: "\n"),
                    kind.films.joined(separator: "\n"),
                    kind.created,
                    kind.edited
                ]
            case .Starships:
                guard let starship = data as? Starship else {
                    return
                }
                
                dataArray = [
                    starship.name,
                    starship.model,
                    starship.starship_class,
                    starship.manufacturer,
                    starship.cost_in_credits,
                    starship.length,
                    starship.crew,
                    starship.passengers,
                    starship.max_atmosphering_speed,
                    starship.hyperdrive_rating,
                    starship.MGLT,
                    starship.cargo_capacity,
                    starship.consumables,
                    starship.films.joined(separator: "\n"),
                    starship.pilots.joined(separator: "\n"),
                    starship.created,
                    starship.edited
                ]
            case .Vehicles:
                guard let vehicle = data as? Vehicle else {
                    return
                }
                
                dataArray = [
                    vehicle.name,
                    vehicle.model,
                    vehicle.vehicle_class,
                    vehicle.manufacturer,
                    vehicle.length,
                    vehicle.cost_in_credits,
                    vehicle.crew,
                    vehicle.passengers,
                    vehicle.max_atmosphering_speed,
                    vehicle.cargo_capacity,
                    vehicle.consumables,
                    vehicle.films.joined(separator: "\n"),
                    vehicle.pilots.joined(separator: "\n"),
                    vehicle.created,
                    vehicle.edited
                ]
            }
        }
    }
}

extension DetailsViewModel {
    func dataForRow(at indexPath: IndexPath) -> String {
        return dataArray[indexPath.section]
    }
    
    func sectionTitle(for index: Int) -> String {
        return dataSectionTitles[index]
    }
}

extension DetailsViewModel {
    var dataSectionTitles: [String] {
        switch dataType {
        case .People:
            return ["Name", "Birth year", "Eye Color", "Gender", "Hair color", "Height", "Mass", "Skin color", "Homeworld", "Films",
                    "Species", "Starships", "Vehicles", "Created", "Edited"]
        case .Films:
            return ["Title", "Episode", "Opening", "Director", "Producer", "Release date", "Species", "Starships", "Vehicles", "Characters", "Planets", "Created", "Edited"]
        case .Planets:
            return ["Name", "Diameter", "Rotation period", "Orbital period", "Gravity", "Population", "Climate", "Terrain", "Surface water", "Residents", "Films", "Created", "Edited"]
        case .Species:
            return ["Name", "Classification", "Designation", "Average height", "Average lifespan", "Eye colors", "Hair colors", "Skin colors", "Language", "People", "Films", "Ereated", "Edited"]
        case .Starships:
            return ["Name", "Model", "Starship class", "Manufacturer", "Cost in credits", "Length", "Crew", "Passengers", "Max atmosphering speed", "Hyperdrive rating", "MGLT", "Cargo capacity", "Consumables", "Films", "Pilots", "Created", "Edited"]
        case .Vehicles:
            return ["Name", "Model", "Vehicle class", "Manufacturer", "Length", "Cost in credits", "Crew", "Passengers", "Max atmosphering speed", "Cargo capacity", "Consumables", "Films", "Pilots", "Created", "Edited"]
        }
    }
}
