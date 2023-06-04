//
//  DetailRouteViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/3/23.
//

import UIKit

class DetailRouteViewController: UIViewController {
    var routeID: Int?
    // MARK: - Properties
    var routeDetail: RoutesDetail?
    let rateView = RateView()
    let wasteView = WasteView()
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
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardStartCoordintateIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardStartCoordintateX: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardStartComma: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardStartCoordintateY: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardFinishCoordintateIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cardFinishCoordintateX: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardFinishComma: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let cardFinishCoordintateY: UILabel = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadCardDetails()
    }
    
    func setupUI() {
        title = "Маршруты"
        view.backgroundColor = UIColor(named: "Background")
        view.addSubview(scrollView)
        scrollView.addSubview(cardPlacesImage)
        scrollView.addSubview(cardNameTitle)
        scrollView.addSubview(cardLocationName)
        scrollView.addSubview(cardLocationIcon)
        scrollView.addSubview(cardStartCoordintateIcon)
        scrollView.addSubview(cardStartCoordintateX)
        scrollView.addSubview(cardStartComma)
        scrollView.addSubview(cardStartCoordintateY)
        scrollView.addSubview(cardFinishCoordintateIcon)
        scrollView.addSubview(cardFinishCoordintateX)
        scrollView.addSubview(cardFinishComma)
        scrollView.addSubview(cardFinishCoordintateY)
        scrollView.addSubview(cardLengthIcon)
        scrollView.addSubview(cardLengthLabel)
        scrollView.addSubview(cardLengthMetricLabel)
        scrollView.addSubview(cardTimeIcon)
        scrollView.addSubview(cardTimeLabel)
        scrollView.addSubview(mapButton)
        scrollView.addSubview(saveButton)
        scrollView.addSubview(reportButton)
        scrollView.addSubview(shareButton)
        scrollView.addSubview(cardDescription)
        scrollView.addSubview(rateView)
        scrollView.addSubview(wasteView)
        NSLayoutConstraint.activate([
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
            
            cardStartCoordintateIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 23),
            cardStartCoordintateIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            cardStartCoordintateX.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardStartCoordintateX.leadingAnchor.constraint(equalTo: cardStartCoordintateIcon.trailingAnchor, constant: 4),
            
            cardStartComma.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardStartComma.heightAnchor.constraint(equalToConstant: 17),
            cardStartComma.leadingAnchor.constraint(equalTo: cardStartCoordintateX.trailingAnchor, constant: 1),
            
            cardStartCoordintateY.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
            cardStartCoordintateY.leadingAnchor.constraint(equalTo: cardStartComma.trailingAnchor, constant: 4),
            
            cardFinishCoordintateIcon.topAnchor.constraint(equalTo: cardStartCoordintateIcon.bottomAnchor, constant: 23),
            cardFinishCoordintateIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            cardFinishCoordintateX.topAnchor.constraint(equalTo: cardStartCoordintateX.bottomAnchor, constant: 16),
            cardFinishCoordintateX.leadingAnchor.constraint(equalTo: cardFinishCoordintateIcon.trailingAnchor, constant: 4),
            
            cardFinishComma.topAnchor.constraint(equalTo: cardStartCoordintateX.bottomAnchor, constant: 16),
            cardFinishComma.heightAnchor.constraint(equalToConstant: 17),
            cardFinishComma.leadingAnchor.constraint(equalTo: cardFinishCoordintateX.trailingAnchor, constant: 1),
            
            cardFinishCoordintateY.topAnchor.constraint(equalTo: cardStartCoordintateX.bottomAnchor, constant: 16),
            cardFinishCoordintateY.leadingAnchor.constraint(equalTo: cardFinishComma.trailingAnchor, constant: 4),
            
            cardLengthIcon.topAnchor.constraint(equalTo: cardFinishCoordintateIcon.bottomAnchor, constant: 25.5),
            cardLengthIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            cardLengthLabel.topAnchor.constraint(equalTo: cardFinishCoordintateX.bottomAnchor, constant: 16),
            cardLengthLabel.leadingAnchor.constraint(equalTo: cardLengthIcon.trailingAnchor, constant: 4),
            
            cardLengthMetricLabel.topAnchor.constraint(equalTo: cardFinishCoordintateX.bottomAnchor, constant: 16),
            cardLengthMetricLabel.heightAnchor.constraint(equalToConstant: 17),
            cardLengthMetricLabel.leadingAnchor.constraint(equalTo: cardLengthLabel.trailingAnchor, constant: 2),
            
            cardTimeIcon.topAnchor.constraint(equalTo: cardFinishCoordintateX.bottomAnchor, constant: 19.5),
            cardTimeIcon.leadingAnchor.constraint(equalTo: cardLengthMetricLabel.trailingAnchor, constant: 17.5),
            
            cardTimeLabel.topAnchor.constraint(equalTo: cardFinishCoordintateX.bottomAnchor, constant: 16),
            cardTimeLabel.leadingAnchor.constraint(equalTo: cardTimeIcon.trailingAnchor, constant: 4),
            
            mapButton.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            mapButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            saveButton.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            saveButton.leadingAnchor.constraint(equalTo: mapButton.trailingAnchor, constant: 16),
            
            reportButton.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            reportButton.leadingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 16),
            
            shareButton.topAnchor.constraint(equalTo: cardLengthLabel.bottomAnchor, constant: 16),
            shareButton.leadingAnchor.constraint(equalTo: reportButton.trailingAnchor, constant: 16),
            
            cardDescription.topAnchor.constraint(equalTo: mapButton.bottomAnchor, constant: 16),
            cardDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cardDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            rateView.topAnchor.constraint(equalTo: cardDescription.bottomAnchor, constant: 16),
            rateView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            rateView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            rateView.heightAnchor.constraint(equalToConstant: 172),
            
            wasteView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            wasteView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            wasteView.topAnchor.constraint(equalTo: rateView.bottomAnchor, constant: 16),
            wasteView.heightAnchor.constraint(equalToConstant: 292),
            wasteView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
        
    }
    
    private func loadCardDetails() {
        guard let routeID = routeID else { return }

        // Construct the URL with the placeID
        let urlString = "\(apiLink)/review/routes/\(routeID)"
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
                let routeDetail = try decoder.decode(RoutesDetail.self, from: data)

                DispatchQueue.main.async {
                    self?.displayCard(with: routeDetail)
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
    
    
    private func displayCard(with routeDetail: RoutesDetail) {
        if let photoURLString = routeDetail.objectInfo.photo, let photoURL = URL(string: apiLink + photoURLString) {
            self.loadImage(from: photoURL)
        } else {
            self.cardPlacesImage.image = UIImage(named: "noImage")
        }
        cardNameTitle.text = routeDetail.objectInfo.name
        cardLocationIcon.image = UIImage(named: "locationIcon")
        cardLocationName.text = routeDetail.objectInfo.locality
        cardStartCoordintateIcon.image = UIImage(named: "routeStartIcon")
        cardStartCoordintateX.text = routeDetail.objectInfo.startE
        cardStartComma.text = ","
        cardStartCoordintateY.text = routeDetail.objectInfo.startN
        cardFinishCoordintateIcon.image = UIImage(named: "routeFinishIcon")
        cardFinishCoordintateX.text = routeDetail.objectInfo.endE
        cardFinishComma.text = ","
        cardFinishCoordintateY.text = routeDetail.objectInfo.endN
        cardLengthIcon.image = UIImage(named: "routeLengthIcon")
        cardLengthLabel.text = String(routeDetail.objectInfo.length)
        cardLengthMetricLabel.text = "км"
        cardTimeIcon.image = UIImage(named: "routeTimeIcon")
        cardTimeLabel.text = routeDetail.objectInfo.duration
        cardDescription.text = routeDetail.objectInfo.description
        rateView.rateLabel.text = "Рейтинг"
        rateView.cardTransportIcon.image = UIImage(named: "transportIcon")
        rateView.cardTransportLabel.text = "Доступность"
        rateView.cardBeautyIcon.image = UIImage(named: "beautyIcon")
        rateView.cardBeautyLabel.text = "Красота"
        rateView.cardPollutionIcon.image = UIImage(named: "pollutionIcon")
        rateView.cardPollutionLabel.text = "Чистота"
        rateView.cardTransportRateLabel.text = String(routeDetail.objectInfo.avgAvailability ?? 0)
        rateView.cardBeautyRateLabel.text = String(routeDetail.objectInfo.avgBeauty ?? 0)
        rateView.cardPollutionRateLabel.text = String(routeDetail.objectInfo.avgPurity ?? 0)
        wasteView.wasteLabel.text = "Собранные отходы"
        wasteView.cardPlasticIcon.image = UIImage(named: "plasticIcon")
        wasteView.cardPlasticLabel.text = "Пластик"
        wasteView.cardPlasticWeightLabel.text = "0.0"
        wasteView.cardPlasticWeightMetricLabel.text = "кг"
        wasteView.cardBatteryIcon.image = UIImage(named: "batteriesIcon")
        wasteView.cardBatteryLabel.text = "Батарейки"
        wasteView.cardBatteryWeightLabel.text = "0.0"
        wasteView.cardBatteryWeightMetricLabel.text = "кг"
        wasteView.cardBulbIcon.image = UIImage(named: "bulbsIcon")
        wasteView.cardBulbLabel.text = "Лампочки"
        wasteView.cardBulbWeightLabel.text = "0.0"
        wasteView.cardBulbWeightMetricLabel.text = "кг"
        wasteView.cardPaperIcon.image = UIImage(named: "papersIcon")
        wasteView.cardPaperLabel.text = "Бумага"
        wasteView.cardPaperWeightLabel.text = "0.0"
        wasteView.cardPaperWeightMetricLabel.text = "кг"
        wasteView.cardMetallIcon.image = UIImage(named: "metalsIcon")
        wasteView.cardMetallLabel.text = "Металл"
        wasteView.cardMetallWeightLabel.text = "0.0"
        wasteView.cardMetallWeightMetricLabel.text = "кг"
        wasteView.cardGlassIcon.image = UIImage(named: "glassIcon")
        wasteView.cardGlassLabel.text = "Стекло"
        wasteView.cardGlassWeightLabel.text = "0.0"
        wasteView.cardGlassWeightMetricLabel.text = "кг"
    }
    
    @objc private func saveCard() { print("Save button tapped") }
    @objc private func shareCard() { print("Share button tapped") }
    @objc private func showMap() { print("Show map button tapped") }
    @objc private func createReport() { print("Create report button tapped") }
}

