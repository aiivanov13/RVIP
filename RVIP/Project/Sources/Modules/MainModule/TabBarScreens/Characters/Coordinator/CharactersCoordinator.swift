//
//  CharactersCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class CharactersCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: CharactersData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: CharactersData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        let presenter = CharactersPresenter()
        let worker = CharactersWorker()
        let interactor = CharactersInteractor(presenter: presenter, worker: worker, data: data)
        let view = CharactersViewController(interactor: interactor)
        view.coordinator = self
        presenter.view = view
        view.tabBarItem = UITabBarItem(title: "Characters", image: Appearance.Images.TabBar.person, tag: 0)
        
        navigationController.setViewControllers([view], animated: false)
    }
}
