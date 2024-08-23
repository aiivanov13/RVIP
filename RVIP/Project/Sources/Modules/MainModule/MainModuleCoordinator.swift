//
//  MainModuleCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 02.08.2024.
//

import UIKit

final class MainModuleCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: MainTabBarData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: MainTabBarData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        toMainTabBar()
    }
    
    func toMainTabBar() {
        let mainTabBarCoordinator = MainTabBarCoordinator(navigationController: navigationController, parentCoordinator: self, data: data)
        addChildCoordinator(mainTabBarCoordinator)
        mainTabBarCoordinator.start()
    }
}
