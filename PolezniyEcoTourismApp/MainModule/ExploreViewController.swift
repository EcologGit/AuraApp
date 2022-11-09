//
//  ViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 10/30/22.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private let horizontalExploreMenuCollectionView = HorizontalExploreMenuCollectionView()
    private var exploreCardCollectionView = PlacesCardCollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(horizontalExploreMenuCollectionView)
        view.addSubview(exploreCardCollectionView)
        horizontalExploreMenuCollectionView.cellDelegate = self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalExploreMenuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            horizontalExploreMenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            horizontalExploreMenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            horizontalExploreMenuCollectionView.heightAnchor.constraint(equalToConstant: 44),
            
            exploreCardCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exploreCardCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            exploreCardCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            exploreCardCollectionView.topAnchor.constraint(equalTo: horizontalExploreMenuCollectionView.bottomAnchor, constant: 16)
            ])
    }

}

extension ExploreViewController: SelectCollectionViewItemProtocol {
    func selectItem(index: IndexPath) {
        print(index)
        }
}


