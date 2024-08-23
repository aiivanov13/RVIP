//
//  AuthorizationPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol AuthorizationPresentationLogicProtocol {

}

//MARK: - AuthorizationPresenter

final class AuthorizationPresenter {
    weak var view: AuthorizationDisplayLogicProtocol?
}

//MARK: - AuthorizationPresentationLogicProtocol

extension AuthorizationPresenter: AuthorizationPresentationLogicProtocol {

}
