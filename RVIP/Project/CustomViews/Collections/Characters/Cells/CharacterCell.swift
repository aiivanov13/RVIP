//
//  CharacterCell.swift
//  RVIP
//
//  Created by Александр Иванов on 22.08.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class CharacterCell: UICollectionViewCell {
    
    // MARK: - структуры и перечисления
    
    struct Data {
        let name: String
        let status: CharacterStatus
        let image: String
    }
    
    // MARK: - элементы UI

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = Appearance.Fonts.Text.primary
        view.textColor = Appearance.Colors.Text.primary
        return view
    }()
    
    private lazy var statusImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let view = UILabel()
        view.font = Appearance.Fonts.Text.primary
        view.textColor = Appearance.Colors.Text.primary
        return view
    }()
    
    // MARK: - переменные
    
    var data: Data! {
        didSet {
            nameLabel.text = data.name
            statusLabel.text = data.status.rawValue
            
            switch data.status {
            case .Alive:
                statusImageView.image = Appearance.Images.CharacterStatus.alive
            case .Dead:
                statusImageView.image = Appearance.Images.CharacterStatus.dead
            case .unknown:
                statusImageView.image = Appearance.Images.CharacterStatus.unknown
            }
            
            if let url = URL(string: data.image) {
                imageView.kf.setImage(with: url)
            }
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
        clipsToBounds = true
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubviews(imageView, nameLabel, statusImageView, statusLabel)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.directionalVerticalEdges.leading.equalToSuperview()
            $0.width.equalTo(imageView.snp.height)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        statusImageView.snp.makeConstraints {
            $0.height.width.equalTo(10)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.centerY.equalTo(statusLabel)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(statusImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - методы и функции
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.kf.cancelDownloadTask()
    }
}
