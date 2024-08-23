//
//  MainTabBarViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol MainTabBarDisplayLogicProtocol: AnyObject {
    var coordinator: MainTabBarCoordinator? { get }
}

//MARK: - MainTabBarViewController

final class MainTabBarViewController: UITabBarController {
    private var interactor: MainTabBarBusinessLogicProtocol
    weak var coordinator: MainTabBarCoordinator?
    
    // MARK: - UI
    
    // MARK: - Initializers
    
    init(interactor: MainTabBarBusinessLogicProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.tintColor = Appearance.Colors.Button.blue
        tabBar.backgroundColor = Appearance.Colors.Background.white.withAlphaComponent(0.9)
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {

    }
    
    // MARK: - Methods
    
}

//MARK: - MainTabBarDisplayLogicProtocol

extension MainTabBarViewController: MainTabBarDisplayLogicProtocol {

}
