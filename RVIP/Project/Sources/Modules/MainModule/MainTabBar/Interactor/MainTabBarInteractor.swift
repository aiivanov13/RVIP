//
//  MainTabBarInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol MainTabBarBusinessLogicProtocol {
    
}

//MARK: - MainTabBarInteractor

final actor MainTabBarInteractor {
    private var presenter: MainTabBarPresentationLogicProtocol
    private var worker: ThirdWorkerLogicProtocol
    private var data: MainTabBarData?
    
    // MARK: - Initializers
    
    init(presenter: MainTabBarPresentationLogicProtocol, worker: ThirdWorkerLogicProtocol,  data: MainTabBarData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - MainTabBarBusinessLogicProtocol

extension MainTabBarInteractor: MainTabBarBusinessLogicProtocol {

}
