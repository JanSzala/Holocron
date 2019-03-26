//
//  MainTableViewModel.swift
//  SWAPI_client
//
//  Created by JanSzala on 12/01/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

internal class MainTableViewModel: MainTableViewModelType {
    var showDetails: ((Any, DataType) -> ())?
    
    var dataType: DataType = .People
    var controllerTitle: String = ""
    var currentPage: Int = 1
    var shouldFetchData: Bool = true
    var dataArray = [Any]()
    
    let numberOfSections: Int = 1
    
    var peopleArrayCount: Int {
        return dataArray.count
    }
    
    let apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    func presentDetails(for indexPath: IndexPath) {
        showDetails?(dataArray[indexPath.row], dataType)
    }
        
    func title(for indexPath: IndexPath) -> String? {
        switch dataType {
        case .People:
            guard let person = dataArray[indexPath.row] as? Person else {
                return nil
            }
            
            return person.name
        case .Films:
            guard let film = dataArray[indexPath.row] as? Film else {
                return nil
            }
            
            return film.title
        case .Species:
            guard let kind = dataArray[indexPath.row] as? Kind else {
                return nil
            }
            
            return kind.name
        case .Starships:
            guard let starship = dataArray[indexPath.row] as? Starship else {
                return nil
            }
            
            return starship.name
        case .Vehicles:
            guard let vehicle = dataArray[indexPath.row] as? Vehicle else {
                return nil
            }
            
            return vehicle.name
        case .Planets:
            guard let planet = dataArray[indexPath.row] as? Planet else {
                return nil
            }
            
            return planet.name
        }
        
    }
    
    func fetchData(onSuccess: @escaping () -> (), onFailure: @escaping () -> (), noMoreData: @escaping () -> ()) {
        guard shouldFetchData == true else {
            noMoreData()
            return
        }
        
        switch dataType {
        case .People:
            apiClient.getPeople(endPoint: .People, page: currentPage, onSuccess: { data in
                self.currentPage += 1
                
                guard let arrayOfData = data.results else {
                    fatalError("could not fill the array with results")
                }
                
                self.shouldFetchData = data.next != nil
                
                self.dataArray.append(contentsOf: arrayOfData)
                onSuccess()
            }, onFailure: {
                print("Failed fetching data")
                onFailure()
            })
        case .Films:
            apiClient.getFilms(endPoint: .Films, page: currentPage, onSuccess: { data in
                self.currentPage += 1
                
                guard let arrayOfData = data.results else {
                    fatalError("could not fill the array with results")
                }
                
                self.shouldFetchData = data.next != nil
                
                self.dataArray.append(contentsOf: arrayOfData)
                onSuccess()
            }, onFailure: {
                print("Failed fetching data")
                onFailure()
            })
        case .Species:
            apiClient.getSpecies(endPoint: .Species, page: currentPage, onSuccess: { data in
                self.currentPage += 1
                
                guard let arrayOfData = data.results else {
                    fatalError("could not fill the array with results")
                }

                self.shouldFetchData = data.next != nil
                
                self.dataArray.append(contentsOf: arrayOfData)
                onSuccess()
            }, onFailure: {
                print("Failed fetching data")
                onFailure()
            })
        case .Starships:
            apiClient.getStarships(endPoint: .Starships, page: currentPage, onSuccess: { data in
                self.currentPage += 1
                
                guard let arrayOfData = data.results else {
                    fatalError("could not fill the array with results")
                }
                
                self.shouldFetchData = data.next != nil
                
                self.dataArray.append(contentsOf: arrayOfData)
                onSuccess()
            }, onFailure: {
                print("Failed fetching data")
                onFailure()
            })
        case .Vehicles:
            apiClient.getVehicles(endPoint: .Vehicles, page: currentPage, onSuccess: { data in
                self.currentPage += 1
                
                guard let arrayOfData = data.results else {
                    fatalError("could not fill the array with results")
                }
                
                self.shouldFetchData = data.next != nil
                
                self.dataArray.append(contentsOf: arrayOfData)
                onSuccess()
            }, onFailure: {
                print("Failed fetching data")
                onFailure()
            })
        case .Planets:
            apiClient.getPlanets(endPoint: .Planets, page: currentPage, onSuccess: { data in
                self.currentPage += 1
                
                guard let arrayOfData = data.results else {
                    fatalError("could not fill the array with results")
                }
                
                self.shouldFetchData = data.next != nil
                
                self.dataArray.append(contentsOf: arrayOfData)
                onSuccess()
            }, onFailure: {
                print("Failed fetching data")
                onFailure()
            })
        }
    }
}
