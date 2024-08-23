//
//  LocationsInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol LocationsBusinessLogicProtocol {
    func fetchData() async
}

//MARK: - LocationsInteractor

final class LocationsInteractor {
    private var presenter: LocationsPresentationLogicProtocol
    private var worker: LocationsWorkerLogicProtocol
    private var data: LocationsData?
    
    // MARK: - Initializers
    
    init(presenter: LocationsPresentationLogicProtocol, worker: LocationsWorkerLogicProtocol, data: LocationsData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - LocationsBusinessLogicProtocol

extension LocationsInteractor: LocationsBusinessLogicProtocol {
    func fetchData() async {
        guard let data = data else { return }
        await presenter.dataLoaded(data)
    }
}
