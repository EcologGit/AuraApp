//
//  WasteInputView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/6/23.
//

import UIKit
class WasteInputView: UIView {
    // MARK: - Properties
    // UI components
    let wasteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Собранные отходы"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let cardPlasticIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "plasticIcon")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardPlasticLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Пластик"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let plasticTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cardPlasticWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "кг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBatteryIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "batteriesIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardBatteryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Батарейки"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let batteryTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cardBatteryWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "кг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardBulbIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bulbsIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardBulbLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Лампочки"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let bulbTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cardBulbWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "кг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardPaperIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "papersIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardPaperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Бумага"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let paperTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cardPaperWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "кг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardMetallIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "metalsIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardMetallLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Металл"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let metalTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cardMetallWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "кг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let cardGlassIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "glassIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardGlassLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Стекло"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let glassTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cardGlassWeightMetricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "кг"
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
        addSubview(plasticTextField)
        addSubview(cardPlasticWeightMetricLabel)
        addSubview(cardBatteryIcon)
        addSubview(cardBatteryLabel)
        addSubview(batteryTextField)
        addSubview(cardBatteryWeightMetricLabel)
        addSubview(cardBulbIcon)
        addSubview(cardBulbLabel)
        addSubview(bulbTextField)
        addSubview(cardBulbWeightMetricLabel)
        addSubview(cardPaperIcon)
        addSubview(cardPaperLabel)
        addSubview(paperTextField)
        addSubview(cardPaperWeightMetricLabel)
        addSubview(cardMetallIcon)
        addSubview(cardMetallLabel)
        addSubview(metalTextField)
        addSubview(cardMetallWeightMetricLabel)
        addSubview(cardGlassIcon)
        addSubview(cardGlassLabel)
        addSubview(glassTextField)
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
            
            plasticTextField.topAnchor.constraint(equalTo: wasteLabel.bottomAnchor, constant: 16),
            plasticTextField.heightAnchor.constraint(equalToConstant: 24),
            plasticTextField.widthAnchor.constraint(equalToConstant: 34),
            plasticTextField.trailingAnchor.constraint(equalTo: cardPlasticWeightMetricLabel.leadingAnchor, constant: -4),
            
            cardPlasticWeightMetricLabel.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            cardPlasticWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPlasticWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardBatteryIcon.topAnchor.constraint(equalTo: cardPlasticIcon.bottomAnchor, constant: 16),
            cardBatteryIcon.heightAnchor.constraint(equalToConstant: 24),
            cardBatteryIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardBatteryLabel.topAnchor.constraint(equalTo: cardPlasticLabel.bottomAnchor, constant: 20),
            cardBatteryLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBatteryLabel.leadingAnchor.constraint(equalTo: cardBatteryIcon.trailingAnchor, constant: 8),
            
            batteryTextField.topAnchor.constraint(equalTo: plasticTextField.bottomAnchor, constant: 16),
            batteryTextField.heightAnchor.constraint(equalToConstant: 24),
            batteryTextField.widthAnchor.constraint(equalToConstant: 34),
            batteryTextField.trailingAnchor.constraint(equalTo: cardBatteryWeightMetricLabel.leadingAnchor, constant: -4),
            
            cardBatteryWeightMetricLabel.topAnchor.constraint(equalTo: cardPlasticWeightMetricLabel.bottomAnchor, constant: 20),
            cardBatteryWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBatteryWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardBulbIcon.topAnchor.constraint(equalTo: cardBatteryIcon.bottomAnchor, constant: 16),
            cardBulbIcon.heightAnchor.constraint(equalToConstant: 24),
            cardBulbIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardBulbLabel.topAnchor.constraint(equalTo: cardBatteryLabel.bottomAnchor, constant: 20),
            cardBulbLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBulbLabel.leadingAnchor.constraint(equalTo: cardBulbIcon.trailingAnchor, constant: 8),
            
            bulbTextField.topAnchor.constraint(equalTo: batteryTextField.bottomAnchor, constant: 16),
            bulbTextField.heightAnchor.constraint(equalToConstant: 24),
            bulbTextField.widthAnchor.constraint(equalToConstant: 34),
            bulbTextField.trailingAnchor.constraint(equalTo: cardBulbWeightMetricLabel.leadingAnchor, constant: -4),
            
            cardBulbWeightMetricLabel.topAnchor.constraint(equalTo: cardBatteryWeightMetricLabel.bottomAnchor, constant: 20),
            cardBulbWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardBulbWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardPaperIcon.topAnchor.constraint(equalTo: cardBulbIcon.bottomAnchor, constant: 16),
            cardPaperIcon.heightAnchor.constraint(equalToConstant: 24),
            cardPaperIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardPaperLabel.topAnchor.constraint(equalTo: cardBulbLabel.bottomAnchor, constant: 20),
            cardPaperLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPaperLabel.leadingAnchor.constraint(equalTo: cardPaperIcon.trailingAnchor, constant: 8),
            
            paperTextField.topAnchor.constraint(equalTo: bulbTextField.bottomAnchor, constant: 16),
            paperTextField.heightAnchor.constraint(equalToConstant: 24),
            paperTextField.widthAnchor.constraint(equalToConstant: 34),
            paperTextField.trailingAnchor.constraint(equalTo: cardPaperWeightMetricLabel.leadingAnchor, constant: -4),
            
            cardPaperWeightMetricLabel.topAnchor.constraint(equalTo: cardBulbWeightMetricLabel.bottomAnchor, constant: 20),
            cardPaperWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardPaperWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardMetallIcon.topAnchor.constraint(equalTo: cardPaperIcon.bottomAnchor, constant: 16),
            cardMetallIcon.heightAnchor.constraint(equalToConstant: 24),
            cardMetallIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardMetallLabel.topAnchor.constraint(equalTo: cardPaperLabel.bottomAnchor, constant: 20),
            cardMetallLabel.heightAnchor.constraint(equalToConstant: 20),
            cardMetallLabel.leadingAnchor.constraint(equalTo: cardMetallIcon.trailingAnchor, constant: 8),
            
            metalTextField.topAnchor.constraint(equalTo: paperTextField.bottomAnchor, constant: 16),
            metalTextField.heightAnchor.constraint(equalToConstant: 24),
            metalTextField.widthAnchor.constraint(equalToConstant: 34),
            metalTextField.trailingAnchor.constraint(equalTo: cardMetallWeightMetricLabel.leadingAnchor, constant: -4),
            
            cardMetallWeightMetricLabel.topAnchor.constraint(equalTo: cardPaperWeightMetricLabel.bottomAnchor, constant: 20),
            cardMetallWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardMetallWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            cardGlassIcon.topAnchor.constraint(equalTo: cardMetallIcon.bottomAnchor, constant: 16),
            cardGlassIcon.heightAnchor.constraint(equalToConstant: 24),
            cardGlassIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            cardGlassLabel.topAnchor.constraint(equalTo: cardMetallLabel.bottomAnchor, constant: 20),
            cardGlassLabel.heightAnchor.constraint(equalToConstant: 20),
            cardGlassLabel.leadingAnchor.constraint(equalTo: cardGlassIcon.trailingAnchor, constant: 8),
            
            glassTextField.topAnchor.constraint(equalTo: metalTextField.bottomAnchor, constant: 16),
            glassTextField.heightAnchor.constraint(equalToConstant: 24),
            glassTextField.widthAnchor.constraint(equalToConstant: 34),
            glassTextField.trailingAnchor.constraint(equalTo: cardGlassWeightMetricLabel.leadingAnchor, constant: -4),
            
            cardGlassWeightMetricLabel.topAnchor.constraint(equalTo: cardMetallWeightMetricLabel.bottomAnchor, constant: 20),
            cardGlassWeightMetricLabel.heightAnchor.constraint(equalToConstant: 20),
            cardGlassWeightMetricLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
