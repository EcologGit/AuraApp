//
//  RateInputView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/6/23.
//

import UIKit

class RateInputView: UIView {
    // MARK: - Properties
    let rateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Рейтинг"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let rateAttentionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Метрика от 1 до 5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
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
        label.text = "Доступность"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let transportTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        label.text = "Красота"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let beautyTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        label.text = "Чистота"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let pollutionTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 0.5
        textField.tintColor = UIColor(named: "DarkGrey")
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        addSubview(rateAttentionLabel)
        addSubview(cardTransportIcon)
        addSubview(cardTransportLabel)
        addSubview(transportTextField)
        addSubview(cardBeautyIcon)
        addSubview(cardBeautyLabel)
        addSubview(beautyTextField)
        addSubview(cardPollutionIcon)
        addSubview(cardPollutionLabel)
        addSubview(pollutionTextField)
        
        NSLayoutConstraint.activate([
        rateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        rateLabel.heightAnchor.constraint(equalToConstant: 20),
        rateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        rateAttentionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        rateAttentionLabel.heightAnchor.constraint(equalToConstant: 20),
        rateAttentionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        cardTransportIcon.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 16),
        cardTransportIcon.heightAnchor.constraint(equalToConstant: 24),
        cardTransportIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        cardTransportLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 18),
        cardTransportLabel.heightAnchor.constraint(equalToConstant: 20),
        cardTransportLabel.leadingAnchor.constraint(equalTo: cardTransportIcon.trailingAnchor, constant: 8),
        
        transportTextField.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 16),
        transportTextField.heightAnchor.constraint(equalToConstant: 24),
        transportTextField.widthAnchor.constraint(equalToConstant: 34),
        transportTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        cardBeautyIcon.topAnchor.constraint(equalTo: cardTransportIcon.bottomAnchor, constant: 16),
        cardBeautyIcon.heightAnchor.constraint(equalToConstant: 24),
        cardBeautyIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        cardBeautyLabel.topAnchor.constraint(equalTo: cardTransportLabel.bottomAnchor, constant: 20),
        cardBeautyLabel.heightAnchor.constraint(equalToConstant: 20),
        cardBeautyLabel.leadingAnchor.constraint(equalTo: cardBeautyIcon.trailingAnchor, constant: 8),
        
        beautyTextField.topAnchor.constraint(equalTo: transportTextField.bottomAnchor, constant: 16),
        beautyTextField.heightAnchor.constraint(equalToConstant: 24),
        beautyTextField.widthAnchor.constraint(equalToConstant: 34),
        beautyTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        cardPollutionIcon.topAnchor.constraint(equalTo: cardBeautyIcon.bottomAnchor, constant: 16),
        cardPollutionIcon.heightAnchor.constraint(equalToConstant: 24),
        cardPollutionIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        cardPollutionLabel.topAnchor.constraint(equalTo: cardBeautyLabel.bottomAnchor, constant: 20),
        cardPollutionLabel.heightAnchor.constraint(equalToConstant: 20),
        cardPollutionLabel.leadingAnchor.constraint(equalTo: cardPollutionIcon.trailingAnchor, constant: 8),
        
        pollutionTextField.topAnchor.constraint(equalTo: beautyTextField.bottomAnchor, constant: 16),
        pollutionTextField.heightAnchor.constraint(equalToConstant: 24),
        pollutionTextField.widthAnchor.constraint(equalToConstant: 34),
        pollutionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
    ])
    }
}

extension UITextField: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Only allow digits and backspace
        let allowedCharacters = CharacterSet(charactersIn: "0123456789") // You can add additional characters if needed
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet) || string.isEmpty
    }
}
