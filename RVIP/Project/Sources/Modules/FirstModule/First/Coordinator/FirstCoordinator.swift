//
//  FirstCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class FirstCoordinator: BaseCoordinator {
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
        let presenter = FirstPresenter()
        let worker = FirstWorker()
        let interactor = FirstInteractor(presenter: presenter, worker: worker, data: data)
        let view = FirstViewController(interactor: interactor)
        
        view.coordinator = self
        presenter.view = view
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func toSecond(with data: SecondData? = nil) {
        guard let parentCoordinator = parentCoordinator as? FirstModuleCoordinator else { return }
        parentCoordinator.toSecond()
    }
}
