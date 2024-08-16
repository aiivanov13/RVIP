//
//  ThirdWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol ThirdWorkerLogicProtocol {
    var title: String { get async }
}

//MARK: - ThirdWorker

final actor ThirdWorker {
    
}

//MARK: - ThirdWorkerLogicProtocol

extension ThirdWorker: ThirdWorkerLogicProtocol {
    var title: String {
        get async {
            "routeThroughInteractor"
        }
    }
}
