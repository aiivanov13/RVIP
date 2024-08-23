//
//  CharactersViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol CharactersDisplayLogicProtocol: AnyObject {
    var coordinator: CharactersCoordinator? { get }
    
    func displayData(_ data: [CharacterSection])
}

//MARK: - CharactersViewController

final class CharactersViewController: BaseViewController {
    private var interactor: CharactersBusinessLogicProtocol
    weak var coordinator: CharactersCoordinator?
    
    //MARK: - UI
    
    private lazy var charactersCollection: CharactersCollectionView = {
        let view = CharactersCollectionView()
        return view
    }()
    
    // MARK: - Initializers
    
    init(interactor: CharactersBusinessLogicProtocol) {
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
        
        Task { [weak self] in
            guard let self = self else { return }
            await interactor.fetchData()
        }
    }
    
    // MARK: - Setups
    
    private func setupView() {
        header.title = Localization.Characters.charactersHeader
    }

    private func setupHierarchy() {
        view.addSubviews(charactersCollection)
    }
    
    private func setupLayout() {
        charactersCollection.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.directionalHorizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
}

//MARK: - CharactersDisplayLogicProtocol

extension CharactersViewController: CharactersDisplayLogicProtocol {
    func displayData(_ data: [CharacterSection]) {
        charactersCollection.sections = data
    }
}
