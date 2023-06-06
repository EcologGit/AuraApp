import UIKit

class DetailEventsViewController: UIViewController {

    var eventID: Int?

    // MARK: - Properties
    var eventDetail: EventsDetail?
    // MARK: - Subviews
    let rateView = RateView()
    let wasteView = WasteView()
    // Create a UIScrollView
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let cardEventsImage: UIImageView = {
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

    let cardRouteName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()

    let cardRouteIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "routesInactiveIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()

    let cardObjectName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "DarkGrey")
        label.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
        return label
    }()

    let cardObjectIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "routeStartIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()

    let cardEventDateIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "calendarIcon")
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
        image.image = UIImage(named: "timeIcon")
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

    @objc private func saveCard() { print("Save button tapped") }
    @objc private func shareCard() { print("Share button tapped") }
    @objc private func showMap() { print("Show map button tapped") }
    @objc private func createReport() { print("Create report button tapped") }
    // Add additional subviews as per your card's detailed information

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadCardDetails { eventDetail in
            if let eventDetail = eventDetail {
                self.displayCard(with: eventDetail)
            } else {
                // Handle the case where eventDetail is nil
            }
        }
    }

    // MARK: - UI Setup

    private func setupUI() {
            self.title = "Место"
            view.backgroundColor = UIColor(named: "Background")
            // Add subviews
            // Add the scrollView to the view hierarchy
            view.addSubview(scrollView)
            scrollView.addSubview(cardEventsImage)
            scrollView.addSubview(cardNameTitle)
            scrollView.addSubview(cardLocationName)
            scrollView.addSubview(cardLocationIcon)
            scrollView.addSubview(cardRouteIcon)
            scrollView.addSubview(cardRouteName)
            scrollView.addSubview(cardObjectIcon)
            scrollView.addSubview(cardObjectName)
            scrollView.addSubview(cardEventDateIcon)
            scrollView.addSubview(cardEventDateLabel)
            scrollView.addSubview(cardEventTimeIcon)
            scrollView.addSubview(cardEventTimeLabel)
            scrollView.addSubview(cardEventStatusIcon)
            scrollView.addSubview(cardEventStatusLabel)
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

                cardEventsImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
                cardEventsImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                cardEventsImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                cardEventsImage.heightAnchor.constraint(equalToConstant: 390),
                cardEventsImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                cardEventsImage.bottomAnchor.constraint(equalTo: cardNameTitle.topAnchor, constant: -16),

                cardNameTitle.topAnchor.constraint(equalTo: cardEventsImage.bottomAnchor, constant: 16),
                cardNameTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                cardNameTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),

                cardLocationIcon.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 19.5),
                cardLocationIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18),

                cardLocationName.topAnchor.constraint(equalTo: cardNameTitle.bottomAnchor, constant: 16),
                cardLocationName.leadingAnchor.constraint(equalTo: cardLocationIcon.trailingAnchor, constant: 6),
                
                cardRouteIcon.topAnchor.constraint(equalTo: cardLocationIcon.bottomAnchor, constant: 23),
                cardRouteIcon.heightAnchor.constraint(equalToConstant: 10),
                cardRouteIcon.widthAnchor.constraint(equalToConstant: 9),
                cardRouteIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.5),

                cardRouteName.topAnchor.constraint(equalTo: cardLocationName.bottomAnchor, constant: 16),
                cardRouteName.leadingAnchor.constraint(equalTo: cardRouteIcon.trailingAnchor, constant: 4.5),

                cardObjectIcon.topAnchor.constraint(equalTo: cardRouteName.bottomAnchor, constant: 19.5),
                cardObjectIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),

                cardObjectName.topAnchor.constraint(equalTo: cardRouteName.bottomAnchor, constant: 16),
                cardObjectName.leadingAnchor.constraint(equalTo: cardObjectIcon.trailingAnchor, constant: 4),

                cardEventDateIcon.topAnchor.constraint(equalTo: cardObjectName.bottomAnchor, constant: 19.5),
                cardEventDateIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),

                cardEventDateLabel.topAnchor.constraint(equalTo: cardObjectName.bottomAnchor, constant: 16),
                cardEventDateLabel.leadingAnchor.constraint(equalTo: cardEventDateIcon.trailingAnchor, constant: 4),
                cardEventDateLabel.heightAnchor.constraint(equalToConstant: 17),

                cardEventTimeIcon.topAnchor.constraint(equalTo: cardObjectName.bottomAnchor, constant: 19.5),
                cardEventTimeIcon.leadingAnchor.constraint(equalTo: cardEventDateLabel.trailingAnchor, constant: 16),

                cardEventTimeLabel.topAnchor.constraint(equalTo: cardObjectName.bottomAnchor, constant: 16),
                cardEventTimeLabel.leadingAnchor.constraint(equalTo: cardEventTimeIcon.trailingAnchor, constant: 4),
                cardEventTimeLabel.heightAnchor.constraint(equalToConstant: 17),

                cardEventStatusIcon.topAnchor.constraint(equalTo: cardEventDateLabel.bottomAnchor, constant: 19.5),
                cardEventStatusIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),

                cardEventStatusLabel.topAnchor.constraint(equalTo: cardEventTimeLabel.bottomAnchor, constant: 16),
                cardEventStatusLabel.leadingAnchor.constraint(equalTo: cardEventStatusIcon.trailingAnchor, constant: 4),
                cardEventStatusLabel.heightAnchor.constraint(equalToConstant: 17),
                
                mapButton.topAnchor.constraint(equalTo: cardEventStatusLabel.bottomAnchor, constant: 16),
                mapButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                saveButton.topAnchor.constraint(equalTo: cardEventStatusLabel.bottomAnchor, constant: 16),
                saveButton.leadingAnchor.constraint(equalTo: mapButton.trailingAnchor, constant: 16),

                reportButton.topAnchor.constraint(equalTo: cardEventStatusLabel.bottomAnchor, constant: 16),
                reportButton.leadingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 16),

                shareButton.topAnchor.constraint(equalTo: cardEventStatusLabel.bottomAnchor, constant: 16),
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


    func loadCardDetails(completion: @escaping (EventsDetail?) -> Void) {
        guard let eventID = eventID else {
            completion(nil)
            return
        }

        // Construct the URL with the placeID
        let urlString = "\(apiLink)/review/events/\(eventID)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                print("Invalid response")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                // Create a custom decoding strategy
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                // Separate the date and time components
                decoder.dateDecodingStrategy = .custom { decoder -> Date in
                    let container = try decoder.singleValueContainer()
                    let dateString = try container.decode(String.self)
                    if let date = dateFormatter.date(from: dateString) {
                        return date
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid date format: \(dateString)"
                        )
                    }
                }

                let eventDetail = try decoder.decode(EventsDetail.self, from: data)
                DispatchQueue.main.async {
                    completion(eventDetail)
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }

        task.resume()
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
                self?.cardEventsImage.image = image
            }
        }.resume()
    }

    // MARK: - Display Card Details

    private func displayCard(with eventDetail: EventsDetail) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        if let photoURLString = eventDetail.photo, let photoURL = URL(string: apiLink + photoURLString) {
            self.loadImage(from: photoURL)
        } else {
            self.cardEventsImage.image = UIImage(named: "noImage")
        }

        cardNameTitle.text = eventDetail.name
        cardLocationName.text = eventDetail.adress
        print(eventDetail.routes?.first?.name ?? "Nope")
        if let firstRoute = eventDetail.routes?.first?.name {
            cardRouteName.text = firstRoute
        } else {
            cardRouteName.text = "Отсутствует"
        }

        if let objectName = eventDetail.natureObjects?.first?.name {
            cardObjectName.text = objectName
        } else {
            cardObjectName.text =  "Отсутствует"
        }
        let dateString = dateFormatter.string(from: eventDetail.timeStart)
        let components = dateString.components(separatedBy: ", ")
        if let date = components.first {
            cardEventDateLabel.text = date
        }

        if let time = components.last {
            cardEventTimeLabel.text = time
        }
        cardEventStatusLabel.text = eventDetail.statusID.name
        cardEventStatusIcon.image = {
            switch eventDetail.statusID.name {
            case "Запланировано":
                return UIImage(named: "planedIcon")
            case "Активно":
                return UIImage(named: "activeIcon")
            case "Отменено":
                return UIImage(named: "canceledIcon")
            default:
                return UIImage(named: "finishedIcon")
            }
        }()
        cardDescription.text = eventDetail.description
        rateView.cardTransportRateLabel.text = String(eventDetail.avgAvailability ?? 0)
        rateView.cardBeautyRateLabel.text = String(eventDetail.avgBeauty ?? 0)
        rateView.cardPollutionRateLabel.text = String(eventDetail.avgPurity ?? 0)
        wasteView.cardPlasticWeightLabel.text = "0.0"
        wasteView.cardBatteryWeightLabel.text = "0.0"
        wasteView.cardBulbWeightLabel.text = "0.0"
        wasteView.cardPaperWeightLabel.text = "0.0"
        wasteView.cardMetallWeightLabel.text = "0.0"
        wasteView.cardGlassWeightLabel.text = "0.0"
    }
}
