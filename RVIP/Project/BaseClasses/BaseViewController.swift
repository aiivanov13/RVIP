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
        setupHeader()
    }
    
    // MARK: Methods
    
    private func setupHeader() {
        view.addSubview(header)
        header.height = defaultNavigationBarHeight
//        header.titleLabel.textColor = appearance.colors.black31
//        header.titleLabel.font = appearance.fonts.baseFont.semibold16_600
        header.backgroundColor = .clear
    }
}
