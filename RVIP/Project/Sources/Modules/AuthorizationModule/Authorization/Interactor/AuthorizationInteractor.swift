//
//  AuthorizationInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol AuthorizationBusinessLogicProtocol {

}

//MARK: - AuthorizationInteractor

final class AuthorizationInteractor {
    private let presenter: AuthorizationPresentationLogicProtocol
    private let worker: AuthorizationWorkerLogicProtocol
    private var data: AuthorizationData?
    
    // MARK: - Initializers
    
    init(presenter: AuthorizationPresentationLogicProtocol, worker: AuthorizationWorkerLogicProtocol, data: AuthorizationData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - AuthorizationBusinessLogicProtocol

extension AuthorizationInteractor: AuthorizationBusinessLogicProtocol {

}
