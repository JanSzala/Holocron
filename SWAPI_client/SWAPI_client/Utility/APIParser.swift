//
//  APIParser.swift
//  SWAPI_client
//
//  Created by JanSzala on 07/02/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal protocol APIParserType: class {
    func parsePeople(data: Data, onSuccess: @escaping (People) -> (), onFailure: @escaping () -> ())
    func parseFilms(data: Data, onSuccess: @escaping (Films) -> (), onFailure: @escaping () -> ())
    func parseSpecies(data: Data, onSuccess: @escaping (Species) -> (), onFailure: @escaping () -> ())
    func parseStarships(data: Data, onSuccess: @escaping (Starships) -> (), onFailure: @escaping () -> ())
    func parseVehicles(data: Data, onSuccess: @escaping (Vehicles) -> (), onFailure: @escaping () -> ())
    func parsePlanets(data: Data, onSuccess: @escaping (Planets) -> (), onFailure: @escaping () -> ())
}

class APIParser: APIParserType {
    func parsePeople(data: Data, onSuccess: @escaping (People) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(People.self, from: data)
            onSuccess(json)
            
        } catch let error {
            print("Error during serialization of JSON: ", error)
            onFailure()
        }
    }
    
    func parseFilms(data: Data, onSuccess: @escaping (Films) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(Films.self, from: data)
            onSuccess(json)
            
        } catch let error {
            print("Error during serialization of JSON: ", error)
            onFailure()
        }
    }
    
    func parseSpecies(data: Data, onSuccess: @escaping (Species) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(Species.self, from: data)
            onSuccess(json)
            
        } catch let error {
            print("Error during serialization of JSON: ", error)
            onFailure()
        }
    }
    
    func parseStarships(data: Data, onSuccess: @escaping (Starships) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(Starships.self, from: data)
            onSuccess(json)
            
        } catch let error {
            print("Error during serialization of JSON: ", error)
            onFailure()
        }
    }
    
    func parseVehicles(data: Data, onSuccess: @escaping (Vehicles) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(Vehicles.self, from: data)
            onSuccess(json)
            
        } catch let error {
            print("Error during serialization of JSON: ", error)
            onFailure()
        }
    }
    
    func parsePlanets(data: Data, onSuccess: @escaping (Planets) -> (), onFailure: @escaping () -> ()) {
        do {
            let json = try JSONDecoder().decode(Planets.self, from: data)
            onSuccess(json)
            
        } catch let error {
            print("Error during serialization of JSON: ", error)
            onFailure()
        }
    }
    
    
}
