//
//  EventsCollectionViewCell.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/21/22.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
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
        addSubview(cardEventDateIcon)
        addSubview(cardEventDateLabel)
        addSubview(cardEventTimeIcon)
        addSubview(cardEventTimeLabel)
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
            informationView.heightAnchor.constraint(equalToConstant: 113),
            informationView.widthAnchor.constraint(equalToConstant: 358),
            
            cardNameTitle.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 16),
            cardNameTitle.bottomAnchor.constraint(equalTo: cardLocationName.topAnchor, constant: -16),
            cardNameTitle.heightAnchor.constraint(equalToConstant: 20),
            cardNameTitle.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            cardNameTitle.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: 16),
            
            cardLocationIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardLocationIcon.bottomAnchor.constraint(equalTo: cardEventDateIcon.topAnchor, constant: -21),
            cardLocationIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 18),
            
            cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
            cardLocationName.bottomAnchor.constraint(equalTo: cardEventDateLabel.topAnchor, constant: -13.5),
            cardLocationName.heightAnchor.constraint(equalToConstant: 17),
            cardLocationName.leftAnchor.constraint(equalTo: cardLocationIcon.rightAnchor, constant: 4),
            
            cardEventDateIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 21),
            cardEventDateIcon.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: 16),
            
            cardEventDateLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 13.5),
            cardEventDateLabel.leftAnchor.constraint(equalTo: cardEventDateIcon.rightAnchor, constant: 4),
            cardEventDateLabel.heightAnchor.constraint(equalToConstant: 17),
            
            cardEventTimeIcon.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 17),
            cardEventTimeIcon.leftAnchor.constraint(equalTo: cardEventDateLabel.rightAnchor, constant: 16),
            
            cardEventTimeLabel.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 13.5),
            cardEventTimeLabel.leftAnchor.constraint(equalTo: cardEventTimeIcon.rightAnchor, constant: 4),
            cardEventTimeLabel.heightAnchor.constraint(equalToConstant: 17),
            
        ])
    }
}
