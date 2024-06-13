//
//  SecondViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces
protocol SecondDisplayLogicProtocol: AnyObject {
    func displayData(title: String)
}

//MARK: - SecondViewController
final class SecondViewController: UIViewController {
    private var interactor: SecondBusinessLogicProtocol
    private var router: SecondRoutingLogicProtocol
    
    //MARK: - UI
    private lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Initializers
    init(interactor: SecondBusinessLogicProtocol, router: SecondRoutingLogicProtocol) {
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
        
        Task {
            await interactor.getData()
        }
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .blue
    }
    
    private func setupHierarchy() {
        view.addSubview(label)
    }
    
    private func setupLayout() {
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
}

//MARK: - SecondDisplayLogicProtocol
extension SecondViewController: SecondDisplayLogicProtocol {
    func displayData(title: String) {
        label.text = title
    }
}
