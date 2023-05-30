//
//  DetailPlaceViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/30/23.
//

import UIKit

class DetailPlaceViewController: UIViewController {
    
    // MARK: - Properties
    
    var cardData: ExploreCardData!
    // MARK: - Subviews
    let cardPlacesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .none
        return image
    }()
    let cardNameTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 23, weight: .semibold)
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
    
    let cardCoordintateIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardCoordintateX: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardComma: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardCoordintateY: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var mapButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "mapButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "saveButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(saveCard), for: .touchUpInside)
        return button
    }()
    
    lazy var reportButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        let image = UIImage(named: "reportButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(createReport), for: .touchUpInside)
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
    
    let cardDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    @objc private func saveCard() { print("Save button tapped") }
    @objc private func shareCard() { print("Share button tapped") }
    @objc private func showMap() { print("Show map button tapped") }
    @objc private func createReport() { print("Create report button tapped") }
    // Add additional subviews as per your card's detailed information
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayCardDetails()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.title = "Место"
        view.backgroundColor = UIColor(named: "Background")
        // Add subviews
        view.addSubview(cardPlacesImage)
        view.addSubview(cardNameTitle)
        view.addSubview(cardLocationName)
        view.addSubview(cardLocationIcon)
        view.addSubview(cardCoordintateIcon)
        view.addSubview(cardCoordintateX)
        view.addSubview(cardComma)
        view.addSubview(cardCoordintateY)
        view.addSubview(mapButton)
        view.addSubview(saveButton)
        view.addSubview(reportButton)
        view.addSubview(shareButton)
        view.addSubview(cardDescription)
        
        NSLayoutConstraint.activate([
            cardPlacesImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardPlacesImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardPlacesImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardPlacesImage.bottomAnchor.constraint(equalTo: cardNameTitle.topAnchor, constant: -16),
            
            cardNameTitle.topAnchor.constraint(equalTo: cardPlacesImage.bottomAnchor, constant: 16),
            cardNameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardNameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            cardLocationIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardLocationIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            
            cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
            cardLocationName.leadingAnchor.constraint(equalTo: cardLocationIcon.trailingAnchor, constant: 6),
            
            cardCoordintateIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 23),
            cardCoordintateIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            cardCoordintateX.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardCoordintateX.leadingAnchor.constraint(equalTo: cardCoordintateIcon.trailingAnchor, constant: 4),
            
            cardComma.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardComma.heightAnchor.constraint(equalToConstant: 17),
            cardComma.leadingAnchor.constraint(equalTo: cardCoordintateX.trailingAnchor, constant: 1),
            
            cardCoordintateY.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardCoordintateY.leadingAnchor.constraint(equalTo: cardComma.trailingAnchor, constant: 4),
            
            mapButton.topAnchor.constraint(equalTo: cardCoordintateX.bottomAnchor, constant: 16),
            mapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            saveButton.topAnchor.constraint(equalTo: cardCoordintateX.bottomAnchor, constant: 16),
            saveButton.leadingAnchor.constraint(equalTo: mapButton.trailingAnchor, constant: 16),
            
            reportButton.topAnchor.constraint(equalTo: cardCoordintateX.bottomAnchor, constant: 16),
            reportButton.leadingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 16),
            
            shareButton.topAnchor.constraint(equalTo: cardCoordintateX.bottomAnchor, constant: 16),
            shareButton.leadingAnchor.constraint(equalTo: reportButton.trailingAnchor, constant: 16),
            
            cardDescription.topAnchor.constraint(equalTo: mapButton.bottomAnchor, constant: 16),
            cardDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Add additional constraints for other subviews
        ])

    }
    
    // MARK: - Display Card Details
    
    private func displayCardDetails() {
        cardPlacesImage.image = UIImage(named: "NoImage")
        cardNameTitle.text = "Name"
        cardLocationIcon.image = UIImage(named: "locationIcon")
        cardLocationName.text = "Locality"
        cardCoordintateIcon.image = UIImage(named: "coordinateIcon")
        cardComma.text = ","
        cardCoordintateX.text = "xx.xxxxxx"
        cardCoordintateY.text = "yy.yyyyyy"
        cardDescription.text = "SomeText"
        
        // Display additional card details based on the card's type
        if let placeCardData = cardData as? ExplorePlaceCardData {
            // Display place card details
            // Example:
            // let place = placeCardData.place
            // displayPlaceDetails(place)
        } else if let routeCardData = cardData as? ExploreRouteCardData {
            // Display route card details
            // Example:
            // let route = routeCardData.route
            // displayRouteDetails(route)
        } else if let eventCardData = cardData as? ExploreEventCardData {
            // Display event card details
            // Example:
            // let event = eventCardData.event
            // displayEventDetails(event)
        } else if let garbagePointCardData = cardData as? ExploreGarbagePointCardData {
            // Display garbage point card details
            // Example:
            // let garbagePoint = garbagePointCardData.garbagePoint
            // displayGarbagePointDetails(garbagePoint)
        }
    }
    
    // Add additional methods to display detailed information for different card types
    
    // MARK: - Example Methods (You can modify or remove them)
    
    private func displayPlaceDetails(_ place: Place) {
        // Example implementation to display place details
    }
    
    private func displayRouteDetails(_ route: Route) {
        // Example implementation to display route details
    }
    
    private func displayEventDetails(_ event: Event) {
        // Example implementation to display event details
    }
    
    private func displayGarbagePointDetails(_ garbagePoint: GarbagePoint) {
        // Example implementation to display garbage point details
    }
}
