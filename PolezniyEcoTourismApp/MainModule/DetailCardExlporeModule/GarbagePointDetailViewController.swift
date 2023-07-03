//
//  GarbagePointDetailViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/4/23.
//

import UIKit

class GarbagePointDetailViewController: UIViewController {
    
    // MARK: - Properties
    var garbagePointDetail: GarbagePointDetails?
    var garbagePointID: Int?
    // MARK: - Subviews
    // Create a UIScrollView
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
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
        image.image = UIImage(named: "locationIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardCoordintateIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "coordinateIcon")
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
        label.text = ","
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
    
    let cardWorkTimeIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "timeIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardWorkTimeLabel: UILabel = {
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
        label.numberOfLines = 0
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let wasteLabel: UILabel = {
        let label = UILabel()
        label.text = "Типы отходов"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardWastTypeIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardWasteTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        loadCardDetails()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.title = "Точка сортировки"
        view.backgroundColor = UIColor(named: "Background")
        // Add subviews
        // Add the scrollView to the view hierarchy
        view.addSubview(scrollView)
        scrollView.addSubview(cardPlacesImage)
        scrollView.addSubview(cardNameTitle)
        scrollView.addSubview(cardLocationName)
        scrollView.addSubview(cardLocationIcon)
        scrollView.addSubview(cardCoordintateIcon)
        scrollView.addSubview(cardCoordintateX)
        scrollView.addSubview(cardComma)
        scrollView.addSubview(cardCoordintateY)
        scrollView.addSubview(cardWorkTimeIcon)
        scrollView.addSubview(cardWorkTimeLabel)
        scrollView.addSubview(mapButton)
        scrollView.addSubview(saveButton)
        scrollView.addSubview(reportButton)
        scrollView.addSubview(shareButton)
        scrollView.addSubview(cardDescription)
        scrollView.addSubview(informationView)
        scrollView.addSubview(wasteLabel)
        scrollView.addSubview(cardWastTypeIcon)
        scrollView.addSubview(cardWasteTypeLabel)
        
        NSLayoutConstraint.activate([
            // Pin scrollView to the edges of the view
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            cardPlacesImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardPlacesImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardPlacesImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardPlacesImage.heightAnchor.constraint(equalToConstant: 390),
            cardPlacesImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            cardPlacesImage.bottomAnchor.constraint(equalTo: cardNameTitle.topAnchor, constant: -16),
            
            cardNameTitle.topAnchor.constraint(equalTo: cardPlacesImage.bottomAnchor, constant: 16),
            cardNameTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cardNameTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            cardLocationIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
            cardLocationIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),
            
            cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
            cardLocationName.leadingAnchor.constraint(equalTo: cardLocationIcon.trailingAnchor, constant: 6),
            
            cardCoordintateIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 23),
            cardCoordintateIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            cardCoordintateX.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardCoordintateX.leadingAnchor.constraint(equalTo: cardCoordintateIcon.trailingAnchor, constant: 4),
            
            cardComma.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardComma.heightAnchor.constraint(equalToConstant: 17),
            cardComma.leadingAnchor.constraint(equalTo: cardCoordintateX.trailingAnchor, constant: 1),
            
            cardCoordintateY.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardCoordintateY.leadingAnchor.constraint(equalTo: cardComma.trailingAnchor, constant: 4),
            
            cardWorkTimeIcon.topAnchor.constraint(equalTo: cardCoordintateIcon.bottomAnchor, constant: 23),
            cardWorkTimeIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            cardWorkTimeLabel.topAnchor.constraint(equalTo: cardCoordintateX.bottomAnchor, constant: 16),
            cardWorkTimeLabel.leadingAnchor.constraint(equalTo: cardWorkTimeIcon.trailingAnchor, constant: 4),
            
            mapButton.topAnchor.constraint(equalTo: cardWorkTimeLabel.bottomAnchor, constant: 16),
            mapButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            saveButton.topAnchor.constraint(equalTo: cardWorkTimeLabel.bottomAnchor, constant: 16),
            saveButton.leadingAnchor.constraint(equalTo: mapButton.trailingAnchor, constant: 16),
            
            reportButton.topAnchor.constraint(equalTo: cardWorkTimeLabel.bottomAnchor, constant: 16),
            reportButton.leadingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 16),
            
            shareButton.topAnchor.constraint(equalTo: cardWorkTimeLabel.bottomAnchor, constant: 16),
            shareButton.leadingAnchor.constraint(equalTo: reportButton.trailingAnchor, constant: 16),
            
            cardDescription.topAnchor.constraint(equalTo: mapButton.bottomAnchor, constant: 16),
            cardDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cardDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            informationView.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 16),
            informationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            informationView.heightAnchor.constraint(equalToConstant: 92),
            informationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            informationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            
            wasteLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 16),
            wasteLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            
            cardWastTypeIcon.topAnchor.constraint(equalTo: wasteLabel.bottomAnchor, constant: 16),
            cardWastTypeIcon.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 16),
            
            cardWasteTypeLabel.topAnchor.constraint(equalTo: wasteLabel.bottomAnchor, constant: 18),
            cardWasteTypeLabel.leadingAnchor.constraint(equalTo: cardWastTypeIcon.trailingAnchor, constant: 16),
            
        ])
        
    }
    
    private func loadCardDetails() {
        guard let garbagePointID = garbagePointID else { return }
        
        // Construct the URL with the placeID
        let urlString = "\(apiLink)/review/sortPoints/\(garbagePointID)"
        guard let url = URL(string: urlString) else { return }
        
        // Fetch place details using URLSession
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error fetching place details:", error)
                return
            }
            
            // Check if data is available
            guard let data = data else { return }
            
            do {
                // Decode the JSON response into a PlaceDetail object
                let decoder = JSONDecoder()
                let pointDetail = try decoder.decode(GarbagePointDetails.self, from: data)
                
                DispatchQueue.main.async {
                    self?.displayCard(with: pointDetail)
                }
            } catch {
                print("Error decoding place details:", error)
            }
        }.resume()
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error loading image:", error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                return
            }
            
            DispatchQueue.main.async {
                self?.cardPlacesImage.image = image
            }
        }.resume()
    }
    
    // MARK: - Display Card Details
    
    private func displayCard(with pointDetail: GarbagePointDetails) {
        if let photoURLString = pointDetail.photo, let photoURL = URL(string: apiLink + photoURLString) {
            self.loadImage(from: photoURL)
        } else {
            self.cardPlacesImage.image = UIImage(named: "noImage")
        }
        cardNameTitle.text = pointDetail.name
        cardLocationName.text = pointDetail.locality
        cardCoordintateX.text = pointDetail.longitudeE
        cardCoordintateY.text = pointDetail.latitudeN
        cardDescription.text = pointDetail.description
        cardWorkTimeLabel.text = pointDetail.schedule
        if let wasteTypeName = pointDetail.wastTypes.first?.name {
            if wasteTypeName == "Крышечки" {
                cardWastTypeIcon.image = UIImage(named: "plasticIcon")
                cardWasteTypeLabel.text = wasteTypeName
            }  else if wasteTypeName == "Батарейки" {
                cardWastTypeIcon.image = UIImage(named: "batteriesIcon")
                cardWasteTypeLabel.text = wasteTypeName
            }
        }
    }
}

