//
//  KindViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class KindViewModel: DetailsViewModel<Kind>, KindViewModelType {
    var kind: Kind
    
    init(kind: Kind) {
        self.kind = kind
        super.init(controllerTitle: kind.name)
        updateSections(for: kind)
    }
    
    override var dataSectionTitles: [String] {
        return ["Name:",
                "Classification:",
                "Designation:",
                "Average height in centimeters:",
                "Average lifespan in years:",
                "Eye colors:",
                "Hair colors:",
                "Skin colors:",
                "Language:",
                "People:",
                "Films:",
                "Created:",
                "Edited:"]
    }
    
    override func updateSections(for kind: Kind) {
        dataArray = [kind.name,
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
                     kind.createdDateHumanReadable,
                     kind.editedDateHumanReadable]
    }
}
