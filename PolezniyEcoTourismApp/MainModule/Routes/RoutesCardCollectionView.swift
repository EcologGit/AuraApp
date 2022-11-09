//
//  RoutesCardCollectionView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/9/22.
//

import UIKit

class RoutesCardCollectionView: UICollectionView {
    
    private let exploreCardLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: exploreCardLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        exploreCardLayout.scrollDirection = .vertical
        
        backgroundColor = .none
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        register(RoutesCardCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension RoutesCardCollectionView: UICollectionViewDelegate {
    
}

extension RoutesCardCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PlacesCardCollectionViewCell else { return UICollectionViewCell()}
        cell.cardPlacesImage.image = UIImage(named: "NoImage")
        cell.cardNameTitle.text = "Name"
        cell.cardLocationName.text = "Start"
        cell.cardLocationIcon.image = UIImage(named: "locationIcon")
        cell.cardTransportIcon.image = UIImage(named: "transportIcon")
        cell.cardTransportLabel.text = "0,0"
        cell.cardBeautyIcon.image = UIImage(named: "beautyIcon")
        cell.cardBeautyLabel.text = "0,0"
        cell.cardPollutionIcon.image = UIImage(named: "pollutionIcon")
        cell.cardPollutionLabel.text = "0,0"
        return cell
    }
    
}

extension RoutesCardCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.width
        let height = CGFloat(483)
                
        return CGSize(width: width, height: height)
    }
}
