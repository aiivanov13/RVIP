//
//  AppCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        showAuthorizationModule()
    }
    
    private func showAuthorizationModule() {
        let firstCoordinator = AuthorizationModuleCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(firstCoordinator)
        firstCoordinator.start()
    }
    
    func showMainModule(with data: MainTabBarData? = nil) {
        let secondCoordinator = MainModuleCoordinator(navigationController: navigationController, parentCoordinator: self, data: data)
        addChildCoordinator(secondCoordinator)
        secondCoordinator.start()
    }
}
