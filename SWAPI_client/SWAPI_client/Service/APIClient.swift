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
    func getPeople(endPoint: DataType, page: Int, onSuccess: @escaping (People) -> (), onFailure: @escaping  () -> ())
    func getFilms(endPoint: DataType, page: Int, onSuccess: @escaping (Films) -> (), onFailure: @escaping  () -> ())
    func getSpecies(endPoint: DataType, page: Int, onSuccess: @escaping (Species) -> (), onFailure: @escaping  () -> ())
    func getStarships(endPoint: DataType, page: Int, onSuccess: @escaping (Starships) -> (), onFailure: @escaping  () -> ())
    func getVehicles(endPoint: DataType, page: Int, onSuccess: @escaping (Vehicles) -> (), onFailure: @escaping  () -> ())
    func getPlanets(endPoint: DataType, page: Int, onSuccess: @escaping (Planets) -> (), onFailure: @escaping  () -> ())
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
    
    func getPeople(endPoint: DataType, page: Int, onSuccess: @escaping (People) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(endPoint, page), onSuccess: { data in
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
    
    func getFilms(endPoint: DataType, page: Int, onSuccess: @escaping (Films) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(endPoint, page), onSuccess: { data in
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
    
    func getSpecies(endPoint: DataType, page: Int, onSuccess: @escaping (Species) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(endPoint, page), onSuccess: { data in
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
    
    func getStarships(endPoint: DataType, page: Int, onSuccess: @escaping (Starships) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(endPoint, page), onSuccess: { data in
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
    
    func getVehicles(endPoint: DataType, page: Int, onSuccess: @escaping (Vehicles) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(endPoint, page), onSuccess: { data in
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
    
    func getPlanets(endPoint: DataType, page: Int, onSuccess: @escaping (Planets) -> (), onFailure: @escaping  () -> ()) {
        self.urlSessionCreator.createURLSession(pageAddress: router.route(endPoint, page), onSuccess: { data in
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
