//
//  PlacesCardCollectionViewCell.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/4/22.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    let cardPlacesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .none
        image.layer.cornerRadius = 20
        return image
    }()
    
    let cardNameTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let cardLocationName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardLocationIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardTransportIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardTransportLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardBeautyIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardBeautyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardPollutionIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardPollutionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "saveButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(saveCard), for: .touchUpInside)
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "shareButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(shareCard), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func saveCard() {
        print("Save button tapped")
    }
    @objc private func shareCard() { print("Share button tapped") }

    
    private func setupViews() {
        //Places Image
        addSubview(cardPlacesImage)
        //Information View
        addSubview(informationView)
        //Text Attributes
        addSubview(cardNameTitle)
        addSubview(cardLocationIcon)
        addSubview(cardLocationName)
        //Metrics
        addSubview(cardTransportIcon)
        addSubview(cardTransportLabel)
        addSubview(cardBeautyIcon)
        addSubview(cardBeautyLabel)
        addSubview(cardPollutionIcon)
        addSubview(cardPollutionLabel)
        //Buttons
        addSubview(shareButton)
        addSubview(saveButton)
    }

    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            cardPlacesImage.topAnchor.constraint(equalTo: topAnchor),
            cardPlacesImage.leftAnchor.constraint(equalTo: leftAnchor),
            cardPlacesImage.rightAnchor.constraint(equalTo: rightAnchor),
            cardPlacesImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -103),
            
            shareButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shareButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            saveButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            saveButton.rightAnchor.constraint(equalTo: shareButton.leftAnchor, constant: -16),
            
            informationView.topAnchor.constraint(equalTo: cardPlacesImage.topAnchor, constant: 336),
            informationView.leftAnchor.constraint(equalTo: leftAnchor),
            informationView.rightAnchor.constraint(equalTo: rightAnchor),
            informationView.heightAnchor.constraint(equalToConstant: 125),
            informationView.widthAnchor.constraint(equalToConstant: 358),
            
            cardNameTitle.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 16),
            cardNameTitle.bottomAnchor.constraint(equalTo: cardLocationName.topAnchor, constant: -16),
            cardNameTitle.heightAnchor.constraint(equalToConstant: 20),
            cardNameTitle.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardNameTitle.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: 16),
            
            cardLocationIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardLocationIcon.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -19.5),
            cardLocationIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 18),
            
            cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
            cardLocationName.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -16),
            cardLocationName.heightAnchor.constraint(equalToConstant: 17),
            cardLocationName.leftAnchor.constraint(equalTo: cardLocationIcon.rightAnchor, constant: 4),
            
            cardTransportIcon.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardTransportIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            cardTransportIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            
            cardTransportLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 19.5),
            cardTransportLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -19.5),
            cardTransportLabel.leftAnchor.constraint(equalTo: cardTransportIcon.rightAnchor, constant: 8),
            
            cardBeautyIcon.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardBeautyIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            cardBeautyIcon.leftAnchor.constraint(equalTo: cardTransportLabel.rightAnchor, constant: 16),
            
            cardBeautyLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 19.5),
            cardBeautyLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -19.5),
            cardBeautyLabel.leftAnchor.constraint(equalTo: cardBeautyIcon.rightAnchor, constant: 8),
            
            cardPollutionIcon.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardPollutionIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            cardPollutionIcon.leftAnchor.constraint(equalTo: cardBeautyLabel.rightAnchor, constant: 16),
            
            cardPollutionLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 19.5),
            cardPollutionLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -19.5),
            cardPollutionLabel.leftAnchor.constraint(equalTo: cardPollutionIcon.rightAnchor, constant: 8)
        ])
    }
}
