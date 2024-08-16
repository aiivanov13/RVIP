//
//  FourthCoordinator.swift
//  RVIP
//
//  Created by Александр Иванов on 01.08.2024.
//

import UIKit

final class FourthCoordinator: BaseCoordinator {
    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators = [BaseCoordinator]()
    var navigationController: UINavigationController
    private var data: FourthData?
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, data: FourthData? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.data = data
    }
    
    func start() {
        let presenter = FourthPresenter()
        let worker = FourthWorker()
        let interactor = FourthInteractor(presenter: presenter, worker: worker, data: data)
        let view = FourthViewController(interactor: interactor)

        view.coordinator = self
        presenter.view = view
        
        view.modalPresentationStyle = .pageSheet
        
        if let sheet = view.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        navigationController.present(view, animated: true)
    }
}
