//
//  ShipViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class ShipViewModel: ShipViewModelType {
    var controllerTitle: String
    var dataArray = [String]()
    var starship: Starship
    
    var sectionsCount: Int {
        return dataSectionTitles.count
    }
    
    let numberOfRowsInSection: Int = 1
    
    init(starship: Starship) {
        self.starship = starship
        self.controllerTitle = starship.name
        updateSections(for: starship)
    }
}

extension ShipViewModel {
    var dataSectionTitles: [String] {
        return ["Name:",
                "Model:",
                "Starship class:",
                "Manufacturer:",
                "Cost in credits:",
                "Length in meters:",
                "Crew:",
                "Passengers:",
                "Max atmosphering speed",
                "Hyperdrive rating",
                "The Maximum number of Megalights this starship can travel in a standard hour:",
                "Cargo capacity in kilograms:",
                "Consumables:",
                "Films:",
                "Pilots:",
                "Created:",
                "Edited:"]
    }
}

extension ShipViewModel {
    func dataForRow(at indexPath: IndexPath) -> String {
        return dataArray[indexPath.section]
    }
    
    func sectionTitle(for index: Int) -> String {
        return dataSectionTitles[index]
    }
    
    func updateSections(for starship: Starship) {
        dataArray = [starship.name,
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
                     starship.edited]
    }
}
