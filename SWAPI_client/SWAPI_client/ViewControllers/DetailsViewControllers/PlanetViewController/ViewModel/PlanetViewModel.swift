//
//  PlanetViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class PlanetViewModel: DetailsViewModel<Planet>, PlanetViewModelType {
    var planet: Planet
    
    init(planet: Planet) {
        self.planet = planet
        super.init(controllerTitle: planet.name)
        updateSections(for: planet)
    }
    
    override var dataSectionTitles: [String] {
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
    
    override func updateSections(for item: Planet) {
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
