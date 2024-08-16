//
//  BaseController.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import UIKit
import SnapKit

class BaseController: UIViewController, LoaderProtocol, DialogProtocol, ToastProtocol {
    
    // MARK: Properties

    final var tasks: [Task<Void?, Never>] = []
    
    var loader: LoaderViewProtocol?

    final let keyboardService: KeyboardService = KeyboardService()
    
    final var pushAnimation: UIViewControllerAnimatedTransitioning?
    final var popAnimation: UIViewControllerAnimatedTransitioning?
    
    final var backBySwipe: Bool = true {
        didSet {
            guard let screensIntoStackCount: Int = navigationController?.viewControllers.count else { return }
            
            if backBySwipe, screensIntoStackCount <= 1 {
                backBySwipe = false
                return
            }
            navigationController?.interactivePopGestureRecognizer?.isEnabled = backBySwipe
        }
    }
    
    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: Initializers
    
    deinit {
        tasks.forEach {
            $0.cancel()
        }
    }
}

// MARK: - UINavigationControllerDelegate

extension BaseController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            return pushAnimation ?? .none
        case .pop:
            return popAnimation ?? .none
        default: 
            return .none
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension BaseController: UIGestureRecognizerDelegate {
    
    //Распознавание жестов для возврата на предыдущий экран свайпом
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
