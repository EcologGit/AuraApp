//
//  HorizontalExploreMenuCollectionViewCell.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/1/22.
//

import UIKit

class HorizontalExploreMenuCollectionViewCell: UICollectionViewCell {
    
    let nameExploreCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    let iconExploreCategoryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.tintColor = UIColor(named: "DarkGrey")
        return image
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? UIColor(named: "DarkGrey") : UIColor(named: "Green")
            nameExploreCategoryLabel.textColor = self.isSelected ? .white : UIColor(named: "DarkGrey")
            iconExploreCategoryImage.tintColor = self.isSelected ? .white : UIColor(named: "DarkGrey")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraint()
        setConstraints()
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = UIColor(named: "Green")
        layer.cornerRadius = 22
        
        addSubview(nameExploreCategoryLabel)
        addSubview(iconExploreCategoryImage)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            iconExploreCategoryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconExploreCategoryImage.widthAnchor.constraint(equalToConstant: 10),
            iconExploreCategoryImage.heightAnchor.constraint(equalToConstant: 10),
            iconExploreCategoryImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameExploreCategoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameExploreCategoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            nameExploreCategoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            nameExploreCategoryLabel.heightAnchor.constraint(equalToConstant: 10),
            nameExploreCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
