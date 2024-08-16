//
//  FirstWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol FirstWorkerLogicProtocol {
    var title: String { get async }
}

//MARK: - FirstWorker

final actor FirstWorker {
    
}

//MARK: - FirstWorkerLogicProtocol

extension FirstWorker: FirstWorkerLogicProtocol {
    var title: String {
        get async {
            "routeThroughInteractor"
        }
    }
}
