//
//  HeaderView.swift
//  RVIP
//
//  Created by Александр Иванов on 30.07.2024.
//

import UIKit
import SnapKit

final class HeaderView: UIView {
    
    // MARK: structs/enums
    
    enum ButtonAlignment {
        case left, right
    }
    
    // MARK: UI elements
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    private lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    
    private lazy var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    
    // MARK: Properties

    private var buttonWidth: CGFloat = 48.0
    private var leftButtons: [UIButton] = []
    private var rightButtons: [UIButton] = []

    var height: CGFloat = 0 {
        didSet {
            snp.remakeConstraints{
                $0.directionalHorizontalEdges.equalToSuperview()
                $0.top.equalTo(superview?.safeAreaLayoutGuide.snp.top ?? 0.0 )
                $0.height.equalTo(height)
            }
        }
    }
    
    var title: String {
        get { titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }
    
    // MARK: Initializers

    init() {
        super.init(frame: .zero)
        setupSubviews()
        addConstraints()
        
        titleLabel.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setups

    private func setupSubviews() {
        addSubviews(leftStack, titleLabel, rightStack)
    }
    
    private func addConstraints() {
        leftStack.snp.makeConstraints{
            $0.directionalVerticalEdges.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(buttonWidth)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(leftStack.snp.trailing).offset(16)
            $0.directionalVerticalEdges.equalToSuperview()
        }
        
        rightStack.snp.makeConstraints{
            $0.directionalVerticalEdges.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(16)
            $0.width.equalTo(buttonWidth)
        }
    }
    
//    MARK: - TitleLable functionality
    
//    private var titleTappableText: String = ""
//    private var whatToDoWhenTappOnTappableText: (() -> Void)?
//    
//    public func setTapOnTextOfLabel(text: String, closure: @escaping (() -> Void)) {
//        titleTappableText = text
//        whatToDoWhenTappOnTappableText = closure
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapLabel))
//        titleLabel.addGestureRecognizer(gesture)
//        titleLabel.isUserInteractionEnabled = true
//    }
//    
//    @objc private func tapLabel(gesture: UITapGestureRecognizer) {
//        guard let text = titleLabel.text else { return }
//        let textRange = (text as NSString).range(of: titleTappableText)
//        
//        if gesture.didTapTextInLabel(label: titleLabel, inRange: textRange) {
//            whatToDoWhenTappOnTappableText?()
//        }
//    }
//    
//    @discardableResult
//    func addBackButton(isWhite: Bool = false, onTap: ((BaseButton)->())? = nil) -> BaseButton {
//        let button = isWhite ? WhiteBackButton() : BackButton()
//        button.isHidden = false
//        button.onTap = { [weak self] button in
//            guard let _ = self else { return }
//            onTap?(button)
//        }
//        
//        leftButtons.append(button)
//        leftStack.addArrangedSubview(button)
//
//        button.snp.makeConstraints{ make in
//            make.width.equalTo(buttonWidth)
//            make.height.equalToSuperview()
//        }
//        return button
//    }
//    
//    @discardableResult
//    func addButton(image: UIImage, type: ButtonAlignment, onTap: ((BaseButton)->())? = nil) -> BaseButton {
//        
//        let button = BaseButton()
//        button.isHidden = false
//        button.setImage(image, for: .normal)
//        button.onTap = onTap
//        switch type {
//            case .left:
//                leftButtons.append(button)
//                leftStack.addArrangedSubview(button)
//            case .right:
//                rightButtons.append(button)
//                rightStack.addArrangedSubview(button)
//            }
//        button.snp.makeConstraints{ make in
//            make.width.equalTo(buttonWidth)
//            make.height.equalToSuperview()
//        }
//        return button
//    }
//    
//    @discardableResult
//    func addButton(title: String, font: UIFont, titleColor: UIColor, type: ButtonAlignment, onTap: ((BaseButton)->())? = nil) -> BaseButton {
//        
//        let button = BaseButton()
//        button.isHidden = false
//        button.setTitle(title, for: .normal)
//        button.titleLabel?.font = font
//        button.setTitleColor(titleColor, for: .normal)
//        button.onTap = onTap
//        switch type {
//            case .left:
//                leftButtons.append(button)
//                leftStack.addArrangedSubview(button)
//            case .right:
//                rightButtons.append(button)
//                rightStack.addArrangedSubview(button)
//            }
//        button.snp.makeConstraints{ make in
//            make.width.equalTo(buttonWidth)
//            make.height.equalToSuperview()
//        }
//        return button
//    }
}
