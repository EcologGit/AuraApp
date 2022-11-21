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
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let cardStartIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardStartLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardFinishIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardFinishLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
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
    
    let cardTimeMetricLabel: UILabel = {
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
        //Start and Finish Metrics
        addSubview(cardStartIcon)
        addSubview(cardStartLabel)
        addSubview(cardFinishIcon)
        addSubview(cardFinishLabel)
        //Length and Time Metrics
        addSubview(cardLengthIcon)
        addSubview(cardLengthLabel)
        addSubview(cardLengthMetricLabel)
        addSubview(cardTimeIcon)
        addSubview(cardTimeLabel)
        addSubview(cardTimeMetricLabel)
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
            //Image constraints
            cardPlacesImage.topAnchor.constraint(equalTo: topAnchor),
            cardPlacesImage.leftAnchor.constraint(equalTo: leftAnchor),
            cardPlacesImage.rightAnchor.constraint(equalTo: rightAnchor),
            cardPlacesImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -103),
            //Buttons constraints
            shareButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shareButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            saveButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            saveButton.rightAnchor.constraint(equalTo: shareButton.leftAnchor, constant: -16),
            //View constraints
            informationView.topAnchor.constraint(equalTo: cardPlacesImage.topAnchor, constant: 336),
            informationView.leftAnchor.constraint(equalTo: leftAnchor),
            informationView.rightAnchor.constraint(equalTo: rightAnchor),
            informationView.heightAnchor.constraint(equalToConstant: 183),
            informationView.widthAnchor.constraint(equalToConstant: 358),
            //Card Name constraints
            cardNameTitle.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 16),
            cardNameTitle.heightAnchor.constraint(equalToConstant: 20),
            cardNameTitle.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardNameTitle.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: 16),
            //Start and Finish constraints
            cardStartIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardStartIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardStartIcon.bottomAnchor.constraint(equalTo: cardFinishIcon.topAnchor, constant: -15),
            
            cardStartLabel.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardStartLabel.leftAnchor.constraint(equalTo: cardStartIcon.rightAnchor, constant: 4),
            cardStartLabel.bottomAnchor.constraint(equalTo: cardFinishLabel.topAnchor, constant: -8),
            
            cardFinishIcon.topAnchor.constraint(equalTo: cardStartIcon.bottomAnchor, constant: 15),
            cardFinishIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardFinishIcon.bottomAnchor.constraint(equalTo: cardLengthIcon.topAnchor, constant: -25.5),
            
            cardFinishLabel.topAnchor.constraint(equalTo: cardStartLabel.bottomAnchor, constant: 8),
            cardFinishLabel.leftAnchor.constraint(equalTo: cardFinishIcon.rightAnchor, constant: 4),
            cardFinishLabel.bottomAnchor.constraint(equalTo: cardLengthLabel.topAnchor, constant: -16),
            // Length and Time constraints
            cardLengthIcon.topAnchor.constraint(equalTo: cardFinishIcon.bottomAnchor, constant: 25.5),
            cardLengthIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardLengthIcon.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -22),
            
            cardLengthLabel.topAnchor.constraint(equalTo: cardFinishLabel.bottomAnchor, constant: 16),
            cardLengthLabel.leftAnchor.constraint(equalTo: cardLengthIcon.rightAnchor, constant: 4),
            cardLengthLabel.bottomAnchor.constraint(equalTo: cardTransportIcon.topAnchor, constant: -16),
            
            cardLengthMetricLabel.topAnchor.constraint(equalTo: cardFinishLabel.bottomAnchor, constant: 16),
            cardLengthMetricLabel.leftAnchor.constraint(equalTo: cardLengthLabel.rightAnchor, constant: 2),
            cardLengthMetricLabel.bottomAnchor.constraint(equalTo: cardTransportLabel.topAnchor, constant: -19.5),
            
            cardTimeIcon.topAnchor.constraint(equalTo: cardFinishLabel.bottomAnchor, constant: 19.5),
            cardTimeIcon.leftAnchor.constraint(equalTo: cardLengthMetricLabel.rightAnchor, constant: 16),
            cardTimeIcon.bottomAnchor.constraint(equalTo: cardBeautyIcon.topAnchor, constant: -19.5),
            
            cardTimeLabel.topAnchor.constraint(equalTo: cardFinishLabel.bottomAnchor, constant: 16),
            cardTimeLabel.leftAnchor.constraint(equalTo: cardTimeIcon.rightAnchor, constant: 4),
            cardTimeLabel.bottomAnchor.constraint(equalTo: cardBeautyIcon.topAnchor, constant: -16),
            
            cardTimeMetricLabel.topAnchor.constraint(equalTo: cardFinishLabel.bottomAnchor, constant: 16),
            cardTimeMetricLabel.leftAnchor.constraint(equalTo: cardTimeLabel.rightAnchor, constant: 2),
            cardTimeMetricLabel.bottomAnchor.constraint(equalTo: cardBeautyIcon.topAnchor, constant: -16),
            
            // Metrics constraints
            cardTransportIcon.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            cardTransportIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            cardTransportIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            
            cardTransportLabel.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 19.5),
            cardTransportLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -19.5),
            cardTransportLabel.leftAnchor.constraint(equalTo: cardTransportIcon.rightAnchor, constant: 8),
            
            cardBeautyIcon.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            cardBeautyIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            cardBeautyIcon.leftAnchor.constraint(equalTo: cardTransportLabel.rightAnchor, constant: 16),
            
            cardBeautyLabel.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 19.5),
            cardBeautyLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -19.5),
            cardBeautyLabel.leftAnchor.constraint(equalTo: cardBeautyIcon.rightAnchor, constant: 8),
            
            cardPollutionIcon.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            cardPollutionIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            cardPollutionIcon.leftAnchor.constraint(equalTo: cardBeautyLabel.rightAnchor, constant: 16),
            
            cardPollutionLabel.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 19.5),
            cardPollutionLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -19.5),
            cardPollutionLabel.leftAnchor.constraint(equalTo: cardPollutionIcon.rightAnchor, constant: 8)
        ])
    }
}
