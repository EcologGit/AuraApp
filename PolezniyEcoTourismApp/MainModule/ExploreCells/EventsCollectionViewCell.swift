//
//  EventsCollectionViewCell.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/21/22.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
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
        label.numberOfLines = 0
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
    
    let cardEventDateIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardEventDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardEventTimeIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardEventTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardEventStatusIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardEventStatusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "saveButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(saveCard), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "shareButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(shareCard), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func saveCard() {
        print("Save button tapped")
    }
    
    @objc private func shareCard() {
        print("Share button tapped")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        addSubview(cardPlacesImage)
        addSubview(informationView)
        addSubview(cardNameTitle)
        addSubview(cardLocationIcon)
        addSubview(cardLocationName)
        addSubview(cardEventDateIcon)
        addSubview(cardEventDateLabel)
        addSubview(cardEventTimeIcon)
        addSubview(cardEventTimeLabel)
        addSubview(cardEventStatusLabel)
        addSubview(cardEventStatusIcon)
        addSubview(shareButton)
        addSubview(saveButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // Image constraints
            cardPlacesImage.topAnchor.constraint(equalTo: topAnchor),
            cardPlacesImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardPlacesImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardPlacesImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -129),
            
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
            cardLocationIcon.bottomAnchor.constraint(equalTo: cardEventDateIcon.topAnchor, constant: -23),
            cardLocationIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 18),
            
            cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
            cardLocationName.bottomAnchor.constraint(equalTo: cardEventDateLabel.topAnchor, constant: -16),
            cardLocationName.heightAnchor.constraint(equalToConstant: 17),
            cardLocationName.leadingAnchor.constraint(equalTo: cardLocationIcon.trailingAnchor, constant: 6),
            
            // Date and Time constraints
            cardEventDateIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 23),
            cardEventDateIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            
            cardEventDateLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardEventDateLabel.leadingAnchor.constraint(equalTo: cardEventDateIcon.trailingAnchor, constant: 4),
            cardEventDateLabel.heightAnchor.constraint(equalToConstant: 17),
            
            cardEventTimeIcon.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 19.5),
            cardEventTimeIcon.leadingAnchor.constraint(equalTo: cardEventDateLabel.trailingAnchor, constant: 16),
            
            cardEventTimeLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardEventTimeLabel.leadingAnchor.constraint(equalTo: cardEventTimeIcon.trailingAnchor, constant: 4),
            cardEventTimeLabel.heightAnchor.constraint(equalToConstant: 17),
            
            // Status constraints
            cardEventStatusIcon.topAnchor.constraint(equalTo: cardEventDateIcon.bottomAnchor, constant: 23),
            cardEventStatusIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            cardEventStatusIcon.heightAnchor.constraint(equalToConstant: 10),
            cardEventStatusIcon.bottomAnchor.constraint(greaterThanOrEqualTo: informationView.bottomAnchor, constant: -16),
            
            cardEventStatusLabel.topAnchor.constraint(equalTo: cardEventDateLabel.bottomAnchor, constant: 16),
            cardEventStatusLabel.leadingAnchor.constraint(equalTo: cardEventStatusIcon.trailingAnchor, constant: 4),
            cardEventStatusLabel.heightAnchor.constraint(equalToConstant: 17),
            cardEventStatusLabel.bottomAnchor.constraint(greaterThanOrEqualTo: informationView.bottomAnchor, constant: -16)
        ])
    }
}
