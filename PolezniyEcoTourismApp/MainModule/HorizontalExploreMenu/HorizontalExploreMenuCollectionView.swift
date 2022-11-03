//
//  HorizontalExploreMenuCollectionView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/1/22.
//

import UIKit

protocol SelectCollectionViewItemProtocol: AnyObject {
    func selectItem(index: IndexPath)
}

class HorizontalExploreMenuCollectionView: UICollectionView {
    
    private let exploreCategoryLayout = UICollectionViewFlowLayout()
    
    private let exploreNameCategoryArray = ["МЕСТА", "МАРШРУТЫ", "МЕРОПРИЯТИЯ", "ТОЧКИ СОРТИРОВКИ"]
    private let exploreIconCategoryArray = ["flag.fill","point.topleft.down.curvedto.point.filled.bottomright.up","party.popper.fill","trash.fill"]
    
    weak var cellDelegate: SelectCollectionViewItemProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: exploreCategoryLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        exploreCategoryLayout.minimumInteritemSpacing = 16
        exploreCategoryLayout.scrollDirection = .horizontal
        
        bounces = false
        showsHorizontalScrollIndicator = false
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        register(HorizontalExploreMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        selectItem(at: [0,0], animated: true, scrollPosition: [])
    }
}

// MARK: - UICollectionViewDataSource
extension HorizontalExploreMenuCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exploreNameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalExploreMenuCollectionViewCell else { return UICollectionViewCell() }
        cell.nameExploreCategoryLabel.text = exploreNameCategoryArray[indexPath.item]
        cell.iconExploreCategoryImage.image = UIImage(systemName: exploreIconCategoryArray[indexPath.item])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension HorizontalExploreMenuCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cellDelegate?.selectItem(index: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HorizontalExploreMenuCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let exploreCategoryFont = FontKit.roundedFont(ofSize: 14, weight: .semibold)
        let exploreCategoryAttributes = [NSAttributedString.Key.font : exploreCategoryFont as Any]
        let exploreCategoryWidth = exploreNameCategoryArray[indexPath.item].size(withAttributes: exploreCategoryAttributes).width + 50
        
        
        return CGSize(width: exploreCategoryWidth, height: collectionView.frame.height)
    }
}
