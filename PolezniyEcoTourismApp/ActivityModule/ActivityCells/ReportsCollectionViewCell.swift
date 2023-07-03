//
//  ReportsCollectionViewCell.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/10/23.
//

import UIKit

class ReportsCollectionViewCell: UICollectionViewCell {
    
    let cardReportImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .none
        image.layer.cornerRadius = 22
        return image
    }()
    
    let cardUserImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "userImage")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .none
        // Make the image view circular
        image.layer.cornerRadius = image.frame.width / 2
        return image
    }()
    
    let cardUsername: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let cardCreateData: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.textColor = UIColor(named: "DarkGrey")?.withAlphaComponent(0.7)
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardSeparatorDataTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "в"
        label.textColor = UIColor(named: "DarkGrey")
        label.textColor = UIColor(named: "DarkGrey")?.withAlphaComponent(0.7)
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardCreateTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.textColor = UIColor(named: "DarkGrey")?.withAlphaComponent(0.7)
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
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
        image.image = UIImage(named: "transportIcon")
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
        image.image = UIImage(named: "beautyIcon")
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
        image.image = UIImage(named: "pollutionIcon")
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        //Places Image
        addSubview(cardReportImage)
        //Information View
        addSubview(informationView)
        //Text Attributes
        addSubview(cardUserImage)
        addSubview(cardUsername)
        addSubview(cardCreateData)
        addSubview(cardSeparatorDataTime)
        addSubview(cardCreateTime)
        addSubview(cardDescription)
        //Metrics
        addSubview(cardTransportIcon)
        addSubview(cardTransportLabel)
        addSubview(cardBeautyIcon)
        addSubview(cardBeautyLabel)
        addSubview(cardPollutionIcon)
        addSubview(cardPollutionLabel)
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //Image constraints
            cardReportImage.topAnchor.constraint(equalTo: topAnchor),
            cardReportImage.leftAnchor.constraint(equalTo: leftAnchor),
            cardReportImage.rightAnchor.constraint(equalTo: rightAnchor),
            cardReportImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -153),
            
            //View constraints
            informationView.topAnchor.constraint(equalTo: cardReportImage.topAnchor, constant: 336),
            informationView.leftAnchor.constraint(equalTo: leftAnchor),
            informationView.rightAnchor.constraint(equalTo: rightAnchor),
            
            cardUserImage.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 16),
            cardUserImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            cardUsername.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 18),
            cardUsername.leftAnchor.constraint(equalTo: cardUserImage.rightAnchor, constant: 8),
            cardUsername.heightAnchor.constraint(equalToConstant: 17),
            
            cardCreateData.topAnchor.constraint(equalTo: cardUsername.bottomAnchor, constant: 10),
            cardCreateData.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardCreateData.heightAnchor.constraint(equalToConstant: 17),
            
            cardSeparatorDataTime.topAnchor.constraint(equalTo: cardUsername.bottomAnchor, constant: 10),
            cardSeparatorDataTime.leftAnchor.constraint(equalTo: cardCreateData.rightAnchor, constant: 4),
            cardSeparatorDataTime.heightAnchor.constraint(equalToConstant: 17),
            
            cardCreateTime.topAnchor.constraint(equalTo: cardUsername.bottomAnchor, constant: 10),
            cardCreateTime.leftAnchor.constraint(equalTo: cardSeparatorDataTime.rightAnchor, constant: 4),
            cardCreateTime.heightAnchor.constraint(equalToConstant: 17),
            
            cardDescription.topAnchor.constraint(equalTo: cardCreateData.bottomAnchor, constant: 16),
            cardDescription.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardDescription.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: -16),
            cardDescription.heightAnchor.constraint(equalToConstant: 17),
            
            // Metrics constraints
            cardTransportIcon.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 16),
            cardTransportIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            cardTransportIcon.heightAnchor.constraint(equalToConstant: 24),
            cardTransportIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            
            cardTransportLabel.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 18),
            cardTransportLabel.leadingAnchor.constraint(equalTo: cardTransportIcon.trailingAnchor, constant: 8),
            cardTransportLabel.heightAnchor.constraint(equalToConstant: 20),
            cardTransportLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -18),
            
            cardBeautyIcon.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 16),
            cardBeautyIcon.leadingAnchor.constraint(equalTo: cardTransportLabel.trailingAnchor, constant: 16),
            cardBeautyIcon.heightAnchor.constraint(equalToConstant: 24),
            cardBeautyIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            
            cardBeautyLabel.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 18),
            cardBeautyLabel.leadingAnchor.constraint(equalTo: cardBeautyIcon.trailingAnchor, constant: 8),
            cardBeautyLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBeautyLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -18),
            
            cardPollutionIcon.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 16),
            cardPollutionIcon.leadingAnchor.constraint(equalTo: cardBeautyLabel.trailingAnchor, constant: 16),
            cardPollutionIcon.heightAnchor.constraint(equalToConstant: 24),
            cardPollutionIcon.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16),
            
            cardPollutionLabel.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 18),
            cardPollutionLabel.leadingAnchor.constraint(equalTo: cardPollutionIcon.trailingAnchor, constant: 8),
            cardPollutionLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPollutionLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -18)
        ])
    }
}
