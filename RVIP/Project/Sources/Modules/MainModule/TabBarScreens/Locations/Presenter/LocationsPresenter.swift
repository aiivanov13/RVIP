//
//  LocationsPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol LocationsPresentationLogicProtocol {
    func dataLoaded(_ data: LocationsData) async
}

//MARK: - LocationsPresenter

final class LocationsPresenter {
    weak var view: LocationsDisplayLogicProtocol?
}

//MARK: - LocationsPresentationLogicProtocol

extension LocationsPresenter: LocationsPresentationLogicProtocol {
    func dataLoaded(_ data: LocationsData) async {
        let cellData = data.locations.results.map {
            LocationCell.Data(name: $0.name, type: $0.type, dimension: $0.dimension)
        }
        
        let displayData: [LocationSection] = [.location(data: cellData)]
        
        view?.displayData(displayData)
    }
}
