//
//  RoutesCollectionViewCell.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/21/22.
//

import UIKit

class RoutesCollectionViewCell: UICollectionViewCell {
    
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
        label.numberOfLines = 0
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
    
    let cardLengthIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardLengthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardLengthMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardTimeIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
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
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
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
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
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
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "saveButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(saveCard), for: .touchUpInside)
        return button
    }()
    
    lazy var shareButton: UIButton = {
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
        //Location
        addSubview(cardLocationIcon)
        addSubview(cardLocationName)
        //Length and Time Metrics
        addSubview(cardLengthIcon)
        addSubview(cardLengthLabel)
        addSubview(cardLengthMetricLabel)
        addSubview(cardTimeIcon)
        addSubview(cardTimeLabel)
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
            // Image constraints
            cardPlacesImage.topAnchor.constraint(equalTo: topAnchor),
            cardPlacesImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardPlacesImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardPlacesImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -136),
            
            // Buttons constraints
            shareButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            saveButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -16),
            
            // View constraints
            informationView.topAnchor.constraint(equalTo: cardPlacesImage.topAnchor, constant: 336),
            informationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // Card Name constraints
            cardNameTitle.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 16),
            cardNameTitle.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            cardNameTitle.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -16),
            cardNameTitle.bottomAnchor.constraint(equalTo: cardLocationName.topAnchor, constant: -16),
            
            // Location constraints
            cardLocationIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardLocationIcon.bottomAnchor.constraint(greaterThanOrEqualTo: cardLengthIcon.topAnchor, constant: -25.5),
            cardLocationIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 18),
            
            cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
            cardLocationName.bottomAnchor.constraint(equalTo: cardLengthLabel.topAnchor, constant: -16),
            cardLocationName.heightAnchor.constraint(equalToConstant: 17),
            cardLocationName.leadingAnchor.constraint(equalTo: cardLocationIcon.trailingAnchor, constant: 6),
            
            // Length and Time constraints
            cardLengthIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 25.5),
            cardLengthIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            cardLengthIcon.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -22),
            
            cardLengthLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardLengthLabel.leadingAnchor.constraint(equalTo: cardLengthIcon.trailingAnchor, constant: 4),
            cardLengthLabel.heightAnchor.constraint(equalToConstant: 17),
            cardLengthLabel.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -16),
            
            cardLengthMetricLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardLengthMetricLabel.leadingAnchor.constraint(equalTo: cardLengthLabel.trailingAnchor, constant: 2),
            cardLengthMetricLabel.heightAnchor.constraint(equalToConstant: 17),
            cardLengthMetricLabel.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -16),
            
            cardTimeIcon.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 19.5),
            cardTimeIcon.leadingAnchor.constraint(equalTo: cardLengthMetricLabel.trailingAnchor, constant: 17.5),
            cardTimeIcon.bottomAnchor.constraint(equalTo: cardBeautyIcon.topAnchor, constant: -19.5),
            
            cardTimeLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardTimeLabel.leadingAnchor.constraint(equalTo: cardTimeIcon.trailingAnchor, constant: 5.5),
            cardTimeLabel.heightAnchor.constraint(equalToConstant: 17),
            cardTimeLabel.bottomAnchor.constraint(equalTo: cardBeautyIcon.topAnchor, constant: -16),
            
            // Metrics constraints
            cardTransportIcon.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            cardTransportIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            cardTransportIcon.heightAnchor.constraint(equalToConstant: 24),
            cardTransportIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            
            cardTransportLabel.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 18),
            cardTransportLabel.leadingAnchor.constraint(equalTo: cardTransportIcon.trailingAnchor, constant: 8),
            cardTransportLabel.heightAnchor.constraint(equalToConstant: 20),
            cardTransportLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -18),
            
            cardBeautyIcon.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            cardBeautyIcon.leadingAnchor.constraint(equalTo: cardTransportLabel.trailingAnchor, constant: 16),
            cardBeautyIcon.heightAnchor.constraint(equalToConstant: 24),
            cardBeautyIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            
            cardBeautyLabel.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 18),
            cardBeautyLabel.leadingAnchor.constraint(equalTo: cardBeautyIcon.trailingAnchor, constant: 8),
            cardBeautyLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBeautyLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -18),
            
            cardPollutionIcon.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            cardPollutionIcon.leadingAnchor.constraint(equalTo: cardBeautyLabel.trailingAnchor, constant: 16),
            cardPollutionIcon.heightAnchor.constraint(equalToConstant: 24),
            cardPollutionIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            
            cardPollutionLabel.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 18),
            cardPollutionLabel.leadingAnchor.constraint(equalTo: cardPollutionIcon.trailingAnchor, constant: 8),
            cardPollutionLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPollutionLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -18)
        ])
    }
}
