//
//  MainTabBarWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol ThirdWorkerLogicProtocol {
    var title: String { get async }
}

//MARK: - MainTabBarWorker

final actor MainTabBarWorker {
    
}

//MARK: - ThirdWorkerLogicProtocol

extension MainTabBarWorker: ThirdWorkerLogicProtocol {
    var title: String {
        get async {
            "routeThroughInteractor"
        }
    }
}
