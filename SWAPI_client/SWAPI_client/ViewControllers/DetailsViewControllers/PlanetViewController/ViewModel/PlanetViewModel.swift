//
//  PlanetViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class PlanetViewModel: PlanetViewModelType {
    var controllerTitle: String
    var dataArray = [String]()
    var planet: Planet
    
    var sectionsCount: Int {
        return dataSectionTitles.count
    }
    
    let numberOfRowsInSection: Int = 1
    
    init(planet: Planet) {
        self.planet = planet
        self.controllerTitle = planet.name
        updateSections(for: planet)
    }
}

extension PlanetViewModel {
    var dataSectionTitles: [String] {
        return ["Name:",
                "Diameter in kilometers:",
                "Rotation period in hours:",
                "Orbital period in days:",
                "Gravity where '1' is normal or 1 standard G:",
                "Population:",
                "Climate:",
                "Terrain:",
                "Surface water:",
                "Residents:",
                "Films:",
                "Created:",
                "Edited:"]
    }
}

extension PlanetViewModel {
    func dataForRow(at indexPath: IndexPath) -> String {
        return dataArray[indexPath.section]
    }
    
    func sectionTitle(for index: Int) -> String {
        return dataSectionTitles[index]
    }
    
    func updateSections(for planet: Planet) {
        dataArray = [planet.name,
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
                     planet.createdDateHumanReadable,
                     planet.editedDateHumanReadable]
    }
}
