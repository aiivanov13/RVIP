//
//  LocationsViewController.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import UIKit
import SnapKit

//MARK: - Interfaces

@MainActor
protocol LocationsDisplayLogicProtocol: AnyObject {
    var coordinator: LocationsCoordinator? { get }
    
    func displayData(_ data: [LocationSection])
}

//MARK: - LocationsViewController

final class LocationsViewController: BaseViewController {
    private let localization: LocationsLocalization
    private let interactor: LocationsBusinessLogicProtocol
    weak var coordinator: LocationsCoordinator?
    
    //MARK: - UI
    
    private lazy var locationsCollection: LocationsCollectionView = {
        let view = LocationsCollectionView()
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - Initializers
    
    init(interactor: LocationsBusinessLogicProtocol, localization: LocationsLocalization) {
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
            await interactor.fetchData()
        }
    }
    
    // MARK: - Setups
    
    private func setupView() {
        header.title = localization.locationsHeader
    }
    
    private func setupHierarchy() {
        view.addSubviews(locationsCollection)
    }
    
    private func setupLayout() {
        locationsCollection.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.directionalHorizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
}

//MARK: - LocationsDisplayLogicProtocol

extension LocationsViewController: LocationsDisplayLogicProtocol {
    func displayData(_ data: [LocationSection]) {
        locationsCollection.sections = data
    }
}
