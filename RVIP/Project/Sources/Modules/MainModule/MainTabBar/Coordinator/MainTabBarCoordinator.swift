//
//  MainTabBarCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class MainTabBarCoordinator: BaseCoordinator {
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
        let presenter = MainTabBarPresenter()
        let worker = MainTabBarWorker()
        let interactor = MainTabBarInteractor(presenter: presenter, worker: worker, data: data)
        let view = MainTabBarViewController(interactor: interactor)
        
        view.coordinator = self
        view.viewControllers = configureControllers()
        presenter.view = view
        
        navigationController.setViewControllers([view], animated: true)
    }
    
    private func configureControllers() -> [UIViewController] {
        guard let data = data else { return [] }
        
        var controllers = [UIViewController]()
        var coordinators = [BaseCoordinator]()
        
        let charactersCoordinator = CharactersCoordinator(navigationController: UINavigationController(), data: CharactersData(characters: data.characters))
        let locationsCoordinator = LocationsCoordinator(navigationController: UINavigationController(), data: LocationsData(locations: data.locations))
        
        coordinators.append(charactersCoordinator)
        coordinators.append(locationsCoordinator)
        
        childCoordinators.append(contentsOf: coordinators)
        controllers = childCoordinators.map {
            $0.start()
            return $0.navigationController
        }

        return controllers
    }
}
