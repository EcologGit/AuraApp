//
//  ViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 10/30/22.
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK: - Properties
    private var selectedCategory: Category = .places
    
    private var dataForSelectedCategory: [ExploreCardData] {
        switch selectedCategory {
        case .places:
            return explorePlaceCardData.filter { $0.category == selectedCategory }
        case .routes:
            return exploreRouteCardData.filter { $0.category == selectedCategory }
        case .events:
            return exploreEventCardData.filter { $0.category == selectedCategory }
        case .garbagePoints:
            return exploreGarbagePointCardData.filter { $0.category == selectedCategory }
        }
    }
    
    private var tabTiles: [TabView] {
        Category.allCases.map {
            let tabView = TabView(
                activeColor: .white,
                inactiveColor: UIColor(named: "DarkGrey")!,
                activeBgColor: UIColor(named: "DarkGrey")!,
                inactiveBgColor: UIColor(named: "Green")!
            )
            tabView.label.text = $0.description
            tabView.image.image = $0.image
            return tabView
        }
    }
    
    private let scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        cv.backgroundColor = .none
        return cv
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        loadData()
    }
    
    // MARK: - Setup
    
    private func setup() {
        scrollableTabView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register collection view cells
        collectionView.register(PlacesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(RoutesCollectionViewCell.self, forCellWithReuseIdentifier: "pcell")
        collectionView.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: "ecell")
        collectionView.register(GarbagePointsCollectionViewCell.self, forCellWithReuseIdentifier: "gcell")
    }
    
    private func layout() {
        // Add scrollableTabView and collectionView to the view
        view.addSubview(scrollableTabView)
        view.addSubview(collectionView)
        
        // Set constraints for scrollableTabView
        NSLayoutConstraint.activate([
            scrollableTabView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            scrollableTabView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollableTabView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        // Set constraints for collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: scrollableTabView.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
    
    
    
    // MARK: - Data
    private func loadData() {
        scrollableTabView.setup(tabs: tabTiles, selectedIndex: 0)
        
        // Load places data
        guard let placesURL = URL(string: "\(apiLink)/review/places/") else {
            print("Invalid URL")
            return
        }
        
        // Dispatch group to synchronize the completion of all API calls
        let group = DispatchGroup()
        
        // Load places data
        group.enter()
        Parser.shared.parseData(from: placesURL) { (places: [Place]?) in
            if let places = places {
                explorePlaceCardData = places.map { ExplorePlaceCardData(place: $0, category: .places) }
                self.collectionView.reloadData()
            } else {
                // Handle error or lack of data
            }
            group.leave()
        }
        
        // Load routes data
        guard let routesURL = URL(string: "\(apiLink)/review/routes/") else {
            print("Invalid URL")
            return
        }
        
        // Load routes data
        group.enter()
        Parser.shared.parseData(from: routesURL) { (routes: [Route]?) in
            if let routes = routes {
                exploreRouteCardData = routes.map { ExploreRouteCardData(route: $0, category: .routes) }
            } else {
                // Handle error or lack of data
            }
            group.leave()
        }
        
        // Load events data
        guard let eventsURL = URL(string: "\(apiLink)/review/events/") else {
            print("Invalid URL")
            return
        }
        
        // Load events data
        group.enter()
        Parser.shared.parseData(from: eventsURL) { (events: [Event]?) in
            if let events = events {
                exploreEventCardData = events.map { ExploreEventCardData(event: $0, category: .events) }
            } else {
                // Handle error or lack of data
            }
            group.leave()
        }
        
        // Load garbagePoints data
        guard let garbagePointsURL = URL(string: "\(apiLink)/review/sortPoints/") else {
            print("Invalid URL")
            return
        }
        
        // Load garbagePoints data
        group.enter()
        Parser.shared.parseData(from: garbagePointsURL) { (garbagePoints: [GarbagePoint]?) in
            if let garbagePoints = garbagePoints {
                exploreGarbagePointCardData = garbagePoints.map { ExploreGarbagePointCardData(garbagePoint: $0, category: .garbagePoints) }
            } else {
                // Handle error or lack of data
            }
            group.leave()
        }
        
        // Notify when all API calls are completed
        group.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - ScrollableTabViewDelegate

extension ExploreViewController: ScrollableTabViewDelegate {
    
    /// Reload data when a tab is tapped.
    func scrollableTabView(_ tabView: ScrollableTabView, didTapTabAt index: Int) {
        guard index < Category.allCases.count else { return }
        selectedCategory = Category.allCases.filter { $0.rawValue == index }.first!
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension ExploreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = dataForSelectedCategory[indexPath.row]
        
        switch card.category {
        case .places:
            let placeCard = card as! ExplorePlaceCardData
            // Show detailed information for the placeCard
            showDetailScreen(for: placeCard)
        case .routes:
            let routeCard = card as! ExploreRouteCardData
            // Show detailed information for the routeCard
            showDetailRouteScreen(for: routeCard)
        case .events:
            let eventCard = card as! ExploreEventCardData
            // Show detailed information for the eventCard
            showDetailEventScreen(for: eventCard)
        case .garbagePoints:
            let garbagePointCard = card as! ExploreGarbagePointCardData
            // Show detailed information for the garbagePointCard
            showDetailGarbagePointScreen(for: garbagePointCard)
        }
    }
    
    // MARK: - Detail Screen Presentation
    private func showDetailScreen(for placeCard: ExplorePlaceCardData) {
        let detailViewController = DetailPlaceViewController()
        detailViewController.placeID = placeCard.place.objectID
        let navigationController = UINavigationController(rootViewController: detailViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    private func showDetailRouteScreen(for routeCard: ExploreRouteCardData) {
        let detailViewController = DetailRouteViewController()
        detailViewController.routeID = routeCard.route.routeID
        let navigationController = UINavigationController(rootViewController: detailViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    private func showDetailEventScreen(for eventCard: ExploreEventCardData) {
        let detailViewController = DetailEventsViewController()
        detailViewController.eventID = eventCard.event.eventID
        let navigationController = UINavigationController(rootViewController: detailViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    private func showDetailGarbagePointScreen(for garbagePointCard: ExploreGarbagePointCardData) {
        let detailViewController = GarbagePointDetailViewController()
        detailViewController.garbagePointID = garbagePointCard.garbagePoint.pointID
        let navigationController = UINavigationController(rootViewController: detailViewController)
        present(navigationController, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource

extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForSelectedCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = dataForSelectedCategory[indexPath.row]
        
        switch card.category {
        case .places:
            let placeCard = card as! ExplorePlaceCardData
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlacesCollectionViewCell
            configurePlacesCell(cell, with: placeCard)
            return cell
        case .routes:
            let routeCard = card as! ExploreRouteCardData
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pcell", for: indexPath) as! RoutesCollectionViewCell
            configureRoutesCell(cell, with: routeCard)
            return cell
        case .events:
            let eventCard = card as! ExploreEventCardData
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ecell", for: indexPath) as! EventsCollectionViewCell
            configureEventsCell(cell, with: eventCard)
            return cell
        case .garbagePoints:
            let garbagePointCard = card as! ExploreGarbagePointCardData
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gcell", for: indexPath) as! GarbagePointsCollectionViewCell
            configureGarbagePointsCell(cell, with: garbagePointCard)
            return cell
        }
    }
    
    // MARK: - Cell Configuration
    
    private func configurePlacesCell(_ cell: PlacesCollectionViewCell, with card: ExplorePlaceCardData) {
        cell.cardNameTitle.text = card.place.name
        cell.cardLocationName.text = card.place.locality
        cell.cardLocationIcon.image = card.cardLocationIcon
        cell.cardTransportIcon.image = card.cardTransportIcon
        cell.cardTransportLabel.text = String(card.place.avgAvailability ?? 0)
        cell.cardBeautyIcon.image = card.cardBeautyIcon
        cell.cardBeautyLabel.text = String(card.place.avgBeauty ?? 0)
        cell.cardPollutionIcon.image = card.cardPollutionIcon
        cell.cardPollutionLabel.text = String(card.place.avgPurity ?? 0)
        
        if let photoURLString = card.place.photo, let photoURL = URL(string: apiLink + photoURLString) {
            loadImage(from: photoURL, for: cell.cardPlacesImage)
        } else {
            cell.cardPlacesImage.image = UIImage(named: "noImage")
        }
    }
    
    private func configureRoutesCell(_ cell: RoutesCollectionViewCell, with card: ExploreRouteCardData) {
        cell.cardNameTitle.text = card.route.name
        cell.cardLocationName.text = card.route.locality
        cell.cardLocationIcon.image = card.cardLocationIcon
        cell.cardLengthIcon.image = card.cardRouteLengthIcon
        cell.cardLengthLabel.text = String(card.route.length ?? 0)
        cell.cardLengthMetricLabel.text = card.cardRouteLengthMetricLabel
        cell.cardTimeIcon.image = card.cardRouteTimeIcon
        cell.cardTimeLabel.text = card.route.duration
        cell.cardTransportIcon.image = card.cardTransportIcon
        cell.cardTransportLabel.text = String(card.route.avgAvailability ?? 0)
        cell.cardBeautyIcon.image = card.cardBeautyIcon
        cell.cardBeautyLabel.text = String(card.route.avgBeauty ?? 0)
        cell.cardPollutionIcon.image = card.cardPollutionIcon
        cell.cardPollutionLabel.text = String(card.route.avgPurity ?? 0)
        
        if let photoURLString = card.route.photo, let photoURL = URL(string: apiLink + photoURLString) {
            loadImage(from: photoURL, for: cell.cardPlacesImage)
        } else {
            cell.cardPlacesImage.image = UIImage(named: "noImage")
        }
    }
    
    private func configureEventsCell(_ cell: EventsCollectionViewCell, with card: ExploreEventCardData) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        cell.cardNameTitle.text = card.event.name
        cell.cardLocationName.text = card.event.adress
        cell.cardLocationIcon.image = card.cardLocationIcon
        cell.cardEventDateIcon.image = card.cardEventDateIcon
        
        let dateString = dateFormatter.string(from: card.event.datetimeStart)
        let components = dateString.components(separatedBy: ", ")
        if let date = components.first {
            cell.cardEventDateLabel.text = date
        }
        
        if let time = components.last {
            cell.cardEventTimeLabel.text = time
        }
        
        cell.cardEventTimeIcon.image = card.cardEventTimeIcon
        cell.cardEventStatusLabel.text = card.event.status
        
        cell.cardEventStatusIcon.image = {
            switch card.event.status {
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
        
        if let photoURLString = card.event.photo, let photoURL = URL(string: apiLink + photoURLString) {
            loadImage(from: photoURL, for: cell.cardPlacesImage)
        } else {
            cell.cardPlacesImage.image = UIImage(named: "noImage")
        }
    }
    
    private func configureGarbagePointsCell(_ cell: GarbagePointsCollectionViewCell, with card: ExploreGarbagePointCardData) {
        cell.cardNameTitle.text = card.garbagePoint.name
        cell.cardLocationIcon.image = card.cardLocationIcon
        cell.cardLocationName.text = card.garbagePoint.locality
        cell.cardWorkTimeIcon.image = card.cardWorkTimeIcon
        cell.cardWorkTimeLabel.text = card.garbagePoint.schedule
        
        let wasteTypeName = card.garbagePoint.wastTypes.first?.name ?? ""
        cell.cardWastTypeIcon.image = {
            switch wasteTypeName {
            case "Крышечки":
                return UIImage(named: "metalsIcon")
            case "Батарейки":
                return UIImage(named: "batteriesIcon")
            default:
                return nil
            }
        }()
        
        if let photoURLString = card.garbagePoint.photo, let photoURL = URL(string: apiLink + photoURLString) {
            loadImage(from: photoURL, for: cell.cardPlacesImage)
        } else {
            cell.cardPlacesImage.image = UIImage(named: "noImage")
        }
    }
    
    // MARK: - Image Loading
    
    private func loadImage(from url: URL, for imageView: UIImageView) {
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                let image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    imageView.image = UIImage(named: "noImage")
                }
            }
        }
    }
}

extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 16
        let width = collectionView.frame.size.width - spacing
        let card = dataForSelectedCategory[indexPath.row]
        
        switch card.category {
        case .places:
            // Calculate and return the size for the PlacesCollectionViewCell
            let height: CGFloat = 483
            return CGSize(width: width, height: height)
        case .routes:
            // Calculate and return the size for the RoutesCollectionViewCell
            let height: CGFloat =  516 + spacing
            return CGSize(width: width, height: height)
        case .events:
            // Calculate and return the size for the EventsCollectionViewCell
            let height: CGFloat =  509
            return CGSize(width: width, height: height)
        case .garbagePoints:
            // Calculate and return the size for the GarbagePointsCollectionViewCell
            let height: CGFloat = 516 + spacing
            return CGSize(width: width, height: height)
        }
    }
}
