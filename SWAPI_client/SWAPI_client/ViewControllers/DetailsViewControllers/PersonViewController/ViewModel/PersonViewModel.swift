//
//  PersonViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 19/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class PersonViewModel: PersonViewModelType {
    var controllerTitle: String
    var dataArray = [String]()
    var person: Person
    
    var sectionsCount: Int {
        return dataSectionTitles.count
    }
    
    let numberOfRowsInSection: Int = 1
    
    init(person: Person) {
        self.person = person
        self.controllerTitle = person.name
        updateSections(for: person)
    }
}

extension PersonViewModel {
    var dataSectionTitles: [String] {
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
}

extension PersonViewModel {
    func dataForRow(at indexPath: IndexPath) -> String {
        return dataArray[indexPath.section]
    }
    
    func sectionTitle(for index: Int) -> String {
        return dataSectionTitles[index]
    }
    
    func updateSections(for person: Person) {
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
                     person.created,
                     person.edited]
    }
}
