//
//  RateView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/3/23.
//

import UIKit

class RateView: UIView {
    // MARK: - Properties
    var placeDetail: PlaceDetail?
    // UI components
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
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
    
    let cardTransportRateLabel: UILabel = {
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
    
    let cardBeautyRateLabel: UILabel = {
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
    
    let cardPollutionRateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 22
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(rateLabel)
        addSubview(cardTransportIcon)
        addSubview(cardTransportLabel)
        addSubview(cardTransportRateLabel)
        addSubview(cardBeautyIcon)
        addSubview(cardBeautyLabel)
        addSubview(cardBeautyRateLabel)
        addSubview(cardPollutionIcon)
        addSubview(cardPollutionLabel)
        addSubview(cardPollutionRateLabel)
        
        NSLayoutConstraint.activate([
        rateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        rateLabel.heightAnchor.constraint(equalToConstant: 20),
        rateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        rateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        cardTransportIcon.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 16),
        cardTransportIcon.heightAnchor.constraint(equalToConstant: 24),
        cardTransportIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        cardTransportLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 18),
        cardTransportLabel.heightAnchor.constraint(equalToConstant: 20),
        cardTransportLabel.leadingAnchor.constraint(equalTo: cardTransportIcon.trailingAnchor, constant: 8),
        
        cardTransportRateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 54),
        cardTransportRateLabel.heightAnchor.constraint(equalToConstant: 20),
        cardTransportRateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        cardBeautyIcon.topAnchor.constraint(equalTo: cardTransportIcon.bottomAnchor, constant: 16),
        cardBeautyIcon.heightAnchor.constraint(equalToConstant: 24),
        cardBeautyIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        cardBeautyLabel.topAnchor.constraint(equalTo: cardTransportLabel.bottomAnchor, constant: 20),
        cardBeautyLabel.heightAnchor.constraint(equalToConstant: 20),
        cardBeautyLabel.leadingAnchor.constraint(equalTo: cardBeautyIcon.trailingAnchor, constant: 8),
        
        cardBeautyRateLabel.topAnchor.constraint(equalTo: cardTransportRateLabel.bottomAnchor, constant: 18),
        cardBeautyRateLabel.heightAnchor.constraint(equalToConstant: 20),
        cardBeautyRateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        cardPollutionIcon.topAnchor.constraint(equalTo: cardBeautyIcon.bottomAnchor, constant: 16),
        cardPollutionIcon.heightAnchor.constraint(equalToConstant: 24),
        cardPollutionIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        cardPollutionLabel.topAnchor.constraint(equalTo: cardBeautyLabel.bottomAnchor, constant: 20),
        cardPollutionLabel.heightAnchor.constraint(equalToConstant: 20),
        cardPollutionLabel.leadingAnchor.constraint(equalTo: cardPollutionIcon.trailingAnchor, constant: 8),
        
        cardPollutionRateLabel.topAnchor.constraint(equalTo: cardBeautyRateLabel.bottomAnchor, constant: 18),
        cardPollutionRateLabel.heightAnchor.constraint(equalToConstant: 20),
        cardPollutionRateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
    ])
    }
}

