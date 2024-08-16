//
//  ThirdViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol ThirdDisplayLogicProtocol: AnyObject {
    var coordinator: ThirdCoordinator? { get }
    
    func updateBackgroundColor()
}

//MARK: - ThirdViewController

final class ThirdViewController: BaseViewController {
    private var interactor: ThirdBusinessLogicProtocol
    weak var coordinator: ThirdCoordinator?
    
    // MARK: - UI
    
    private lazy var fromViewTapButton: UIButton = {
        let view = UIButton(configuration: getButtonConfiguration())
        view.addTarget(self, action: #selector(onFromViewTap), for: .touchUpInside)
        view.setTitle(Localization.Buttons.fromViewTap, for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private lazy var fromInteractorTapButton: UIButton = {
        let view = UIButton(configuration: getButtonConfiguration())
        view.addTarget(self, action: #selector(onFromInteractorTap), for: .touchUpInside)
        view.setTitle(Localization.Buttons.fromInteractorTapButton, for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    // MARK: - Initializers
    
    init(interactor: ThirdBusinessLogicProtocol) {
        self.interactor = interactor
        super.init()
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
        view.backgroundColor = Appearance.Colors.Background.gray
    }
    
    private func setupHierarchy() {
        view.addSubview(fromViewTapButton)
        view.addSubview(fromInteractorTapButton)
    }
    
    private func setupLayout() {
        fromViewTapButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        fromInteractorTapButton.snp.makeConstraints {
            $0.top.equalTo(fromViewTapButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func getButtonConfiguration() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.titlePadding = 8
        configuration.baseBackgroundColor = Appearance.Colors.Background.white
        return configuration
    }
    
    @objc private func onFromViewTap() {
        coordinator?.toFourth()
    }
    
    @objc private func onFromInteractorTap() {
        view.backgroundColor = Appearance.Colors.Background.green

        Task { [weak self] in
            guard let self = self else { return }
            try await Task.sleep(seconds: 2)
            await interactor.fetchData()
        }
    }
}

//MARK: - FirstDisplayLogicProtocol

extension ThirdViewController: ThirdDisplayLogicProtocol {
    func updateBackgroundColor() {
        view.backgroundColor = Appearance.Colors.Background.red
    }
}
