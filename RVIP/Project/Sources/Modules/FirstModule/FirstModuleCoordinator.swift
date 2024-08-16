//
//  FirstModuleCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 02.08.2024.
//

import UIKit

final class FirstModuleCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: FirstData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: FirstData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        toFirst()
    }
    
    func toFirst() {
        let firstCoordinator = FirstCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(firstCoordinator)
        firstCoordinator.start()
    }
    
    func toSecond() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(secondCoordinator)
        secondCoordinator.start()
    }
    
    func toNextModule(with data: ThirdData) {
        guard let parentCoordinator = parentCoordinator as? AppCoordinator else { return }
        closeModule()
        parentCoordinator.showSecondModule(with: data)
    }
}
