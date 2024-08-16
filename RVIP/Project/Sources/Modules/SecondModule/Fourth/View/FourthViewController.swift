//
//  FourthViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol FourthDisplayLogicProtocol: AnyObject {
    var coordinator: FourthCoordinator? { get }

    func displayData(title: String)
}

//MARK: - FourthViewController

final class FourthViewController: BaseViewController {
    private var interactor: FourthBusinessLogicProtocol
    weak var coordinator: FourthCoordinator?
    
    //MARK: - UI
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = Appearance.Colors.Background.white
        view.textAlignment = .center
        return view
    }()
    
    private lazy var button: BaseButton = {
        let view = BaseButton()
        view.configuration = getButtonConfiguration()
        
        view.onTap = { [weak self] _ in
            guard let self = self else { return }
            onTap()
        }
        view.text = Localization.Buttons.button
        view.actionAfterAnimation = true
        view.setTitleColor(.black, for: .normal)

        return view
    }()
    
    // MARK: - Initializers
    
    init(interactor: FourthBusinessLogicProtocol) {
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
        
        let task = Task { [weak self] in
            await self?.interactor.getData()
        }
        
        tasks.append(task)
        
        backBySwipe = true
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = Appearance.Colors.Background.green
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Appearance.Colors.Background.white.withAlphaComponent(0.5)
        loader?.backgroundView = backgroundView
    }
    
    private func setupHierarchy() {
        view.addSubviews(label, button)
    }
    
    private func setupLayout() {
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func getButtonConfiguration() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.titlePadding = 8
        configuration.baseBackgroundColor = Appearance.Colors.Background.white
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = Appearance.Fonts.Text.primary
            return outgoing
        }
        return configuration
    }
    
    private func onTap() {
        let task = Task { [weak self] in
            await self?.interactor.startCounter()
        }
        tasks.append(task)
    }
}

//MARK: - FourthDisplayLogicProtocol

extension FourthViewController: FourthDisplayLogicProtocol {
    func displayData(title: String) {
        label.text = title
    }
}
