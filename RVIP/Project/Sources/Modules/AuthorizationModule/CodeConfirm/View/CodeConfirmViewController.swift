//
//  CodeConfirmViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol CodeConfirmDisplayLogicProtocol: AnyObject {
    var coordinator: CodeConfirmCoordinator? { get }
    
    func stopLoader()
    func displayData(data: String)
}

//MARK: - CodeConfirmViewController

final class CodeConfirmViewController: BaseViewController {
    private let localization: CodeConfirmLocalization
    private let interactor: CodeConfirmBusinessLogicProtocol
    weak var coordinator: CodeConfirmCoordinator?
    
    // MARK: - UI
    
    private lazy var phoneLabel: UILabel = {
        let view = UILabel()
        view.font = Appearance.Fonts.Text.primary
        view.textColor = Appearance.Colors.Text.secondary
        view.textAlignment = .center
        return view
    }()
    
    private lazy var codeTextField: CodeTextField = {
        let view = CodeTextField()
        view.onEnterLastChar = { [weak self] isLast in
            guard let self = self else { return }
            logInButton.isEnabled = isLast
        }
        return view
    }()
    
    private lazy var logInButton: PrimaryButton = {
        let view = PrimaryButton()
        view.text = Localization.logIn
        view.onTap = { [weak self] _ in
            guard let self = self else { return }
            
            loader(true)

            Task { [weak self] in
                guard let self = self else { return }
                await interactor.fetchData()
            }
        }
        view.isEnabled = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    // MARK: - Initializers
    
    init(interactor: CodeConfirmBusinessLogicProtocol, localization: CodeConfirmLocalization) {
        self.interactor = interactor
        self.localization = localization
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
        
        Task { [weak self] in
            guard let self = self else { return }
            await interactor.loadData()
        }
    }
    
    // MARK: - Setups
    
    private func setupView() {
        header.title = localization.codeConfirmHeader
    }
    
    private func setupHierarchy() {
        stackView.addArrangedSubviews(codeTextField, logInButton)
        view.addSubviews(phoneLabel, stackView)
    }
    
    private func setupLayout() {
        phoneLabel.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(24)
            $0.top.equalTo(phoneLabel.snp.bottom).offset(16)
        }
        
        codeTextField.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        logInButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
    
    // MARK: - Methods
    
}

//MARK: - CodeConfirmDisplayLogicProtocol

extension CodeConfirmViewController: CodeConfirmDisplayLogicProtocol {
    func displayData(data: String) {
        phoneLabel.text = data
    }
    
    func stopLoader() {
        loader(false)
    }
}
