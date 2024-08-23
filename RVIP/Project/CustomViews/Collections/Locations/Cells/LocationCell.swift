//
//  LocationCell.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit
import SnapKit

final class LocationCell: UICollectionViewCell {
    
    // MARK: - структуры и перечисления
    
    struct Data {
        let name: String
        let type: String
        let dimension: String
    }
    
    // MARK: - элементы UI
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = Appearance.Fonts.Text.primary
        view.textColor = Appearance.Colors.Text.primary
        view.textAlignment = .center
        return view
    }()
    
    private lazy var typeLabel: UILabel = {
        let view = UILabel()
        view.font = Appearance.Fonts.Text.primary
        view.textColor = Appearance.Colors.Text.primary
        view.textAlignment = .center
        return view
    }()
    
    private lazy var dimensionLabel: UILabel = {
        let view = UILabel()
        view.font = Appearance.Fonts.Text.primary
        view.textColor = Appearance.Colors.Text.primary
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - переменные
    
    var data: Data! {
        didSet {
            nameLabel.text = data.name
            typeLabel.text = data.type
            dimensionLabel.text = data.dimension
        }
    }
    
    // MARK: - конструкторы
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - настройка UI
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = Appearance.Colors.Background.gray
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubviews(nameLabel, typeLabel, dimensionLabel)
    }
    
    private func addConstraints() {
        nameLabel.snp.makeConstraints {
            $0.directionalHorizontalEdges.top.equalToSuperview().inset(16)
        }
        
        typeLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
        }
        
        dimensionLabel.snp.makeConstraints {
            $0.top.equalTo(typeLabel.snp.bottom).offset(8)
            $0.directionalHorizontalEdges.bottom.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - методы и функции
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
