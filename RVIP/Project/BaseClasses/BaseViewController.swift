//
//  BaseViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import UIKit

class BaseViewController: BaseController {
    
    // MARK: Properties
    
    final var header: HeaderView = HeaderView()
    final let defaultNavigationBarHeight: CGFloat = 48

    // MARK: Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        loader = LoaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeader()
    }
    
    // MARK: Methods
    
    private func setupHeader() {
        view.addSubview(header)
        header.height = defaultNavigationBarHeight
        header.textColor = Appearance.Colors.Text.primary
        header.titleFont = Appearance.Fonts.Text.primary
        header.backgroundColor = .clear
    }
    
    private func setupView() {
        view.backgroundColor = Appearance.Colors.Background.white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Appearance.Colors.Text.primary.withAlphaComponent(0.4)
        loader?.backgroundView = backgroundView
    }
}
