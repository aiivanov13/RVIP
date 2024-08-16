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
        showFirstModule()
    }
    
    private func showFirstModule() {
        let firstCoordinator = FirstModuleCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(firstCoordinator)
        firstCoordinator.start()
    }
    
    func showSecondModule(with data: ThirdData) {
        let secondCoordinator = SecondModuleCoordinator(navigationController: navigationController, parentCoordinator: self, data: data)
        addChildCoordinator(secondCoordinator)
        secondCoordinator.start()
    }
}
