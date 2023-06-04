//
//  WasteView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/3/23.
//

import UIKit
class WasteView: UIView {
    // MARK: - Properties
    var placeDetail: PlaceDetail?
    // UI components
    let wasteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let cardPlasticIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardPlasticLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardPlasticWeightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardPlasticWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBatteryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardBatteryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBatteryWeightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBatteryWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBulbIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardBulbLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBulbWeightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBulbWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardPaperIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardPaperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardPaperWeightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardPaperWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardMetallIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardMetallLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardMetallWeightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardMetallWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardGlassIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardGlassLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardGlassWeightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardGlassWeightMetricLabel: UILabel = {
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
        
        addSubview(wasteLabel)
        addSubview(cardPlasticIcon)
        addSubview(cardPlasticLabel)
        addSubview(cardPlasticWeightLabel)
        addSubview(cardPlasticWeightMetricLabel)
        addSubview(cardBatteryIcon)
        addSubview(cardBatteryLabel)
        addSubview(cardBatteryWeightLabel)
        addSubview(cardBatteryWeightMetricLabel)
        addSubview(cardBulbIcon)
        addSubview(cardBulbLabel)
        addSubview(cardBulbWeightLabel)
        addSubview(cardBulbWeightMetricLabel)
        addSubview(cardPaperIcon)
        addSubview(cardPaperLabel)
        addSubview(cardPaperWeightLabel)
        addSubview(cardPaperWeightMetricLabel)
        addSubview(cardMetallIcon)
        addSubview(cardMetallLabel)
        addSubview(cardMetallWeightLabel)
        addSubview(cardMetallWeightMetricLabel)
        addSubview(cardGlassIcon)
        addSubview(cardGlassLabel)
        addSubview(cardGlassWeightLabel)
        addSubview(cardGlassWeightMetricLabel)
        
        NSLayoutConstraint.activate([
            
            wasteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            wasteLabel.heightAnchor.constraint(equalToConstant: 20),
            wasteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            wasteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardPlasticIcon.topAnchor.constraint(equalTo: wasteLabel.bottomAnchor, constant: 16),
            cardPlasticIcon.heightAnchor.constraint(equalToConstant: 24),
            cardPlasticIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardPlasticLabel.topAnchor.constraint(equalTo: wasteLabel.bottomAnchor, constant: 18),
            cardPlasticLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPlasticLabel.leadingAnchor.constraint(equalTo: cardPlasticIcon.trailingAnchor, constant: 8),
            
            cardPlasticWeightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            cardPlasticWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPlasticWeightLabel.trailingAnchor.constraint(equalTo: cardPlasticWeightMetricLabel.leadingAnchor, constant: -2),
            
            cardPlasticWeightMetricLabel.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            cardPlasticWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPlasticWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardBatteryIcon.topAnchor.constraint(equalTo: cardPlasticIcon.bottomAnchor, constant: 16),
            cardBatteryIcon.heightAnchor.constraint(equalToConstant: 24),
            cardBatteryIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardBatteryLabel.topAnchor.constraint(equalTo: cardPlasticLabel.bottomAnchor, constant: 20),
            cardBatteryLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBatteryLabel.leadingAnchor.constraint(equalTo: cardBatteryIcon.trailingAnchor, constant: 8),
            
            cardBatteryWeightLabel.topAnchor.constraint(equalTo: cardPlasticWeightLabel.bottomAnchor, constant: 20),
            cardBatteryWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBatteryWeightLabel.trailingAnchor.constraint(equalTo: cardBatteryWeightMetricLabel.leadingAnchor, constant: -2),
            
            cardBatteryWeightMetricLabel.topAnchor.constraint(equalTo: cardPlasticWeightMetricLabel.bottomAnchor, constant: 20),
            cardBatteryWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBatteryWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardBulbIcon.topAnchor.constraint(equalTo: cardBatteryIcon.bottomAnchor, constant: 16),
            cardBulbIcon.heightAnchor.constraint(equalToConstant: 24),
            cardBulbIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardBulbLabel.topAnchor.constraint(equalTo: cardBatteryLabel.bottomAnchor, constant: 20),
            cardBulbLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBulbLabel.leadingAnchor.constraint(equalTo: cardBulbIcon.trailingAnchor, constant: 8),
            
            cardBulbWeightLabel.topAnchor.constraint(equalTo: cardBatteryWeightLabel.bottomAnchor, constant: 20),
            cardBulbWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBulbWeightLabel.trailingAnchor.constraint(equalTo: cardBulbWeightMetricLabel.leadingAnchor, constant: -2),
            
            cardBulbWeightMetricLabel.topAnchor.constraint(equalTo: cardBatteryWeightMetricLabel.bottomAnchor, constant: 20),
            cardBulbWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBulbWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardPaperIcon.topAnchor.constraint(equalTo: cardBulbIcon.bottomAnchor, constant: 16),
            cardPaperIcon.heightAnchor.constraint(equalToConstant: 24),
            cardPaperIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardPaperLabel.topAnchor.constraint(equalTo: cardBulbLabel.bottomAnchor, constant: 20),
            cardPaperLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPaperLabel.leadingAnchor.constraint(equalTo: cardPaperIcon.trailingAnchor, constant: 8),
            
            cardPaperWeightLabel.topAnchor.constraint(equalTo: cardBulbWeightLabel.bottomAnchor, constant: 20),
            cardPaperWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPaperWeightLabel.trailingAnchor.constraint(equalTo: cardPaperWeightMetricLabel.leadingAnchor, constant: -2),
            
            cardPaperWeightMetricLabel.topAnchor.constraint(equalTo: cardBulbWeightMetricLabel.bottomAnchor, constant: 20),
            cardPaperWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPaperWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardMetallIcon.topAnchor.constraint(equalTo: cardPaperIcon.bottomAnchor, constant: 16),
            cardMetallIcon.heightAnchor.constraint(equalToConstant: 24),
            cardMetallIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardMetallLabel.topAnchor.constraint(equalTo: cardPaperLabel.bottomAnchor, constant: 20),
            cardMetallLabel.heightAnchor.constraint(equalToConstant: 20),
            cardMetallLabel.leadingAnchor.constraint(equalTo: cardMetallIcon.trailingAnchor, constant: 8),
            
            cardMetallWeightLabel.topAnchor.constraint(equalTo: cardPaperWeightLabel.bottomAnchor, constant: 20),
            cardMetallWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            cardMetallWeightLabel.trailingAnchor.constraint(equalTo: cardMetallWeightMetricLabel.leadingAnchor, constant: -2),
            
            cardMetallWeightMetricLabel.topAnchor.constraint(equalTo: cardPaperWeightMetricLabel.bottomAnchor, constant: 20),
            cardMetallWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardMetallWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardGlassIcon.topAnchor.constraint(equalTo: cardMetallIcon.bottomAnchor, constant: 16),
            cardGlassIcon.heightAnchor.constraint(equalToConstant: 24),
            cardGlassIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardGlassLabel.topAnchor.constraint(equalTo: cardMetallLabel.bottomAnchor, constant: 20),
            cardGlassLabel.heightAnchor.constraint(equalToConstant: 20),
            cardGlassLabel.leadingAnchor.constraint(equalTo: cardGlassIcon.trailingAnchor, constant: 8),
            
            cardGlassWeightLabel.topAnchor.constraint(equalTo: cardMetallWeightLabel.bottomAnchor, constant: 20),
            cardGlassWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            cardGlassWeightLabel.trailingAnchor.constraint(equalTo: cardGlassWeightMetricLabel.leadingAnchor, constant: -2),
            
            cardGlassWeightMetricLabel.topAnchor.constraint(equalTo: cardMetallWeightMetricLabel.bottomAnchor, constant: 20),
            cardGlassWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardGlassWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
