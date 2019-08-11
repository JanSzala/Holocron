//
//  PersonViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class PersonViewModel: DetailsViewModel<Person>, PersonViewModelType {
    var person: Person
    
    init(person: Person) {
        self.person = person
        super.init(controllerTitle: person.name)
        updateSections(for: person)
    }
    
    override var dataSectionTitles: [String] {
        return ["Name:",
                "Birth year:",
                "Eye Color:",
                "Gender:",
                "Hair color:",
                "Height in centimeters:",
                "Mass in kilograms:",
                "Skin color:",
                "Homeworld:",
                "Films:",
                "Species:",
                "Starships:",
                "Vehicles:",
                "Created:",
                "Edited:"]
    }
    
    override func updateSections(for item: Person) {
        dataArray = [person.name,
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
                     person.createdDateHumanReadable,
                     person.editedDateHumanReadable]
    }
}
