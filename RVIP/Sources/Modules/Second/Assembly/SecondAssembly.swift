//
//  SecondAssembly.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit

//MARK: - SecondAssembly
struct SecondAssembly {
    static func assemble(data: SecondData? = nil) -> UIViewController {
        let presenter = SecondPresenter()
        let router = SecondRouter()
        let worker = SecondWorker()
        let interactor = SecondInteractor(presenter: presenter,worker: worker, data: data)
        let view = SecondViewController(interactor: interactor, router: router)
        
        presenter.view = view
        presenter.router = router
        router.viewController = view
        
        return view
    }
}
