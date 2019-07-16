//
//  APIClient.swift
//  SWAPI_client
//
//  Created by JanSzala on 19/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

internal protocol APIClientType: class {
    func getPeople(page: Int, onSuccess: @escaping (People) -> (), onFailure: @escaping  () -> ())
    func getFilms(page: Int, onSuccess: @escaping (Films) -> (), onFailure: @escaping  () -> ())
    func getSpecies(page: Int, onSuccess: @escaping (Species) -> (), onFailure: @escaping  () -> ())
    func getStarships(page: Int, onSuccess: @escaping (Starships) -> (), onFailure: @escaping  () -> ())
    func getVehicles(page: Int, onSuccess: @escaping (Vehicles) -> (), onFailure: @escaping  () -> ())
    func getPlanets(page: Int, onSuccess: @escaping (Planets) -> (), onFailure: @escaping  () -> ())
    
    func getData<T: Decodable>(page: Int, type: DataType, onSuccess: @escaping (T) -> (), onFailure: @escaping  () -> ())
}

internal class APIClient: APIClientType {
    let apiParser: APIParserType
    let router: RouterType
    let urlSessionCreator: URLSessionCreatorType
    
    init(apiParser: APIParserType, router: RouterType, urlSessionCreator: URLSessionCreatorType) {
        self.apiParser = apiParser
        self.router = router
        self.urlSessionCreator = urlSessionCreator
    }
    
    func getData<T: Decodable>(page: Int, type: DataType, onSuccess: @escaping (T) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(type, page), onSuccess: { data in
            self.apiParser.parseData(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
    
    func getPeople(page: Int, onSuccess: @escaping (People) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(.People, page), onSuccess: { data in
            self.apiParser.parsePeople(data: data, onSuccess: { fetchedData in
                    onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure parsing data")
            onFailure()
        })
    }
    
    func getFilms(page: Int, onSuccess: @escaping (Films) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(.Films, page), onSuccess: { data in
            self.apiParser.parseFilms(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
    
    func getSpecies(page: Int, onSuccess: @escaping (Species) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(.Species, page), onSuccess: { data in
            self.apiParser.parseSpecies(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
    
    func getStarships(page: Int, onSuccess: @escaping (Starships) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(.Starships, page), onSuccess: { data in
            self.apiParser.parseStarships(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
    
    func getVehicles(page: Int, onSuccess: @escaping (Vehicles) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(.Vehicles, page), onSuccess: { data in
            self.apiParser.parseVehicles(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
    
    func getPlanets(page: Int, onSuccess: @escaping (Planets) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(.Planets, page), onSuccess: { data in
            self.apiParser.parsePlanets(data: data, onSuccess: { fetchedData in
                onSuccess(fetchedData)
            }, onFailure: {
                logMsg("Failure parsing data")
                onFailure()
            })
        }, onFailure: {
            logMsg("Failure fetching data")
            onFailure()
        })
    }
}
