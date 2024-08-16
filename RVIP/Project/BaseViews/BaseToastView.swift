//
//  BaseToastView.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import UIKit
import SnapKit

class BaseToastView: UIView {
    
    private lazy var gestureView: UIView = {
        let view = UIView()
        var swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftHandler))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right

        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightHandler))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(onTapGesture))
        
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        return view
    }()
    
    // MARK: Properties
    
    var onSwipeLeft: (() -> ())?
    var onSwipeRight: (() -> ())?
    var onTap: (() -> ())?
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            if isUserInteractionEnabled {
                setupGesture()
            }
        }
    }
    
    // MARK: Initializers
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods

    private func setupGesture() {
        addSubview(gestureView)
        
        gestureView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
    
    @objc func swipeLeftHandler() { onSwipeLeft?() }
    @objc func swipeRightHandler() { onSwipeRight?() }
    @objc func onTapGesture() { onTap?() }
}
