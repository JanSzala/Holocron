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
        return personSections.count
    }
    
    let personSections = ["Name",
                          "Birth year",
                          "Eye Color",
                          "Gender",
                          "Hair color",
                          "Height",
                          "Mass",
                          "Skin color",
//                          "Homeworld",
//                          "Films",
//                          "Species",
//                          "Starships",
//                          "Vehicles",
//                          "url",
                          "Created",
                          "Edited"]
    
    let controllerTitle = "Details"
    let numberOfRowsInSection: Int = 1
    
    func sectionTitle(for index: Int) -> String {
        return personSections[index]
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
//                person.homeworld,
//                person.films,
//                person.species,
//                person.starships,
//                person.url,
//                person.vehicles,
                person.created,
                person.edited
            ]
            
            return dataArray[indexPath.section]
        case .Films:
            return("Films")
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
