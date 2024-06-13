//
//  FirstViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces
protocol FirstDisplayLogicProtocol: AnyObject {
    func updateBackgroundColor()
}

//MARK: - FirstViewController
final class FirstViewController: UIViewController {
    private var interactor: FirstBusinessLogicProtocol
    private var router: FirstRoutingLogicProtocol
    
    // MARK: - UI
    private lazy var fromViewTapButton: UIButton = {
        let view = UIButton(configuration: getButtonConfiguration())
        view.addTarget(self, action: #selector(onFromViewTap), for: .touchUpInside)
        view.setTitle("fromViewTap", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private lazy var fromInteractorTapButton: UIButton = {
        let view = UIButton(configuration: getButtonConfiguration())
        view.addTarget(self, action: #selector(onFromInteractorTap), for: .touchUpInside)
        view.setTitle("fromInteractorTapButton", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    // MARK: - Initializers
    init(interactor: FirstBusinessLogicProtocol, router: FirstRoutingLogicProtocol) {
        self.interactor = interactor
        self.router = router
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
        view.backgroundColor = .red
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
        configuration.baseBackgroundColor = .white
        return configuration
    }
    
    @objc private func onFromViewTap() {
        router.pushSecond()
    }
    
    @objc private func onFromInteractorTap() {
        view.backgroundColor = .green

        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            await interactor.fetchData()
        }
    }
}

//MARK: - FirstDisplayLogicProtocol
extension FirstViewController: FirstDisplayLogicProtocol {
    func updateBackgroundColor() {
        view.backgroundColor = .red
    }
}
