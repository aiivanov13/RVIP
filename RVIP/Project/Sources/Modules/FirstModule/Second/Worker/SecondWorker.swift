//
//  SecondWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol SecondWorkerLogicProtocol {

}

//MARK: - SecondWorker

final actor SecondWorker {
    private var network = AsyncHttpJsonClient()
    
    init() {
    }
}

//MARK: - SecondWorkerLogicProtocol

extension SecondWorker: SecondWorkerLogicProtocol {

}
