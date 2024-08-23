//
//  LocationsCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class LocationsCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: LocationsData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: LocationsData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        let presenter = LocationsPresenter()
        let worker = LocationsWorker()
        let interactor = LocationsInteractor(presenter: presenter, worker: worker, data: data)
        let view = LocationsViewController(interactor: interactor)
        view.coordinator = self
        presenter.view = view
        view.tabBarItem = UITabBarItem(title: "Locations", image: Appearance.Images.TabBar.pin, tag: 1)

        navigationController.setViewControllers([view], animated: false)
    }
}
