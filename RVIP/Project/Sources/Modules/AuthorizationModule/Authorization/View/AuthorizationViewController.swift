//
//  AuthorizationViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol AuthorizationDisplayLogicProtocol: AnyObject {
    var coordinator: AuthorizationCoordinator? { get }
}

//MARK: - AuthorizationViewController

final class AuthorizationViewController: BaseViewController {
    private var interactor: AuthorizationBusinessLogicProtocol
    weak var coordinator: AuthorizationCoordinator?
    
    //MARK: - UI
    
    private lazy var phoneTextField: PhoneTextField = {
        let view = PhoneTextField()
        view.onEnterLastChar = { [weak self] isLast in
            guard let self = self else { return }
            logInButton.isEnabled = isLast
        }
        return view
    }()
    
    private lazy var logInButton: PrimaryButton = {
        let view = PrimaryButton()
        view.onTap = { [weak self] _ in
            guard let self = self else { return }
            
            if let phone = phoneTextField.text, !phone.isEmpty {
                coordinator?.toCodeConfirm(with: CodeConfirmData(phone: phone))
            }
        }
        view.text = Localization.Buttons.logIn
        view.actionAfterAnimation = true
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
    
    init(interactor: AuthorizationBusinessLogicProtocol) {
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
        
    }
    
    private func setupHierarchy() {
        stackView.addArrangedSubviews(phoneTextField, logInButton)
        view.addSubviews(stackView)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview().inset(38)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        logInButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
    
    // MARK: - Methods
    
}

//MARK: - AuthorizationDisplayLogicProtocol

extension AuthorizationViewController: AuthorizationDisplayLogicProtocol {

}
