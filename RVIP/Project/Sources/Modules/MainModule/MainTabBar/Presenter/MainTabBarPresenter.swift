//
//  MainTabBarPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol MainTabBarPresentationLogicProtocol {

}

//MARK: - MainTabBarPresenter

final class MainTabBarPresenter {
    weak var view: MainTabBarDisplayLogicProtocol!
}

//MARK: - MainTabBarPresentationLogicProtocol

extension MainTabBarPresenter: MainTabBarPresentationLogicProtocol {

}
