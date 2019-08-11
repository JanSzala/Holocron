//
//  VehicleViewModel.swift
//  SWAPI_client
//
//  Created by GLaDOS on 20/06/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

class VehicleViewModel: DetailsViewModel<Vehicle>, VehicleViewModelType {
    var vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
        super.init(controllerTitle: vehicle.name)
        updateSections(for: vehicle)
    }
    
    override var dataSectionTitles: [String] {
        return ["Name:",
                "Model:",
                "Vehicle class:",
                "Manufacturer:",
                "Length in meters:",
                "Cost in credits:",
                "Crew:",
                "Passengers:",
                "Max atmosphering speed:",
                "Cargo capacity in kilograms:",
                "Consumables:",
                "Films:",
                "Pilots:",
                "Created:",
                "Edited:"]
    }
    
    override func updateSections(for item: Vehicle) {
        dataArray = [vehicle.name,
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
                     vehicle.createdDateHumanReadable,
                     vehicle.editedDateHumanReadable]
    }
}
