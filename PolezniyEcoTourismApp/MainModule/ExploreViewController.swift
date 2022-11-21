//
//  ViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 10/30/22.
//

import UIKit

class ExploreViewController: UIViewController {

    let scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true

        return view
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        cv.backgroundColor = .none
        return cv
    }()
    
    var selectedCategory: Category = .places

    var dataForSelectedCategory: [ExploreCardData] {
        return exploreCardData.filter { $0.category == selectedCategory }.sorted { $0.cardNameTitle < $1.cardNameTitle }
    }

    var tabTiles: [TabView] {
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

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        layout()
        loadData()
    }

    func setup() {
        scrollableTabView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PlacesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(RoutesCollectionViewCell.self, forCellWithReuseIdentifier: "pcell")
        collectionView.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: "ecell")
        collectionView.register(GarbagePointsCollectionViewCell.self, forCellWithReuseIdentifier: "gcell")
    }

    func layout() {
        view.addSubview(scrollableTabView)
        view.addSubview(collectionView)

        scrollableTabView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        scrollableTabView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: scrollableTabView.trailingAnchor, multiplier: 1).isActive = true

        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: scrollableTabView.bottomAnchor, multiplier: 1).isActive = true
        collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: collectionView.trailingAnchor, multiplier: 1).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 0).isActive = true
    }

    func loadData() {
        scrollableTabView.setup(tabs: tabTiles, selectedIndex: 0)
        collectionView.reloadData()
    }
}

// MARK: - ScrollableTabViewDelegate

extension ExploreViewController: ScrollableTabViewDelegate {
    
    /// When tab is tapped reload data.
    func scrollableTabView(_ tabView: ScrollableTabView, didTapTabAt index: Int) {

        guard index < Category.allCases.count else { return }
        selectedCategory = Category.allCases.filter { $0.rawValue == index }.first!

        collectionView.reloadData()
    }
}

// MARK: - UITableView Delegate

extension ExploreViewController: UICollectionViewDelegate {

    
}

// MARK: - UITableView DataSource

extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForSelectedCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = dataForSelectedCategory[indexPath.row]
        switch card.category {
        case .places:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlacesCollectionViewCell
            cell.cardPlacesImage.image = card.cardPlacesImage
            cell.cardNameTitle.text = card.cardNameTitle
            cell.cardLocationName.text = card.cardLocationName
            cell.cardLocationIcon.image = card.cardLocationIcon
            cell.cardTransportIcon.image = card.cardTransportIcon
            cell.cardTransportLabel.text = card.cardTransportLabel
            cell.cardBeautyIcon.image = card.cardBeautyIcon
            cell.cardBeautyLabel.text = card.cardBeautyLabel
            cell.cardPollutionIcon.image = card.cardPollutionIcon
            cell.cardPollutionLabel.text = card.cardPollutionLabel
            return cell
        case .routes:
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "pcell", for: indexPath) as! RoutesCollectionViewCell
            cell1.cardPlacesImage.image = card.cardPlacesImage
            cell1.cardNameTitle.text = card.cardNameTitle
            cell1.cardStartIcon.image = card.cardStartIcon
            cell1.cardStartLabel.text = card.cardStartLabel
            cell1.cardFinishIcon.image = card.cardFinishIcon
            cell1.cardFinishLabel.text = card.cardFinishLabel
            cell1.cardLengthIcon.image = card.cardRouteLengthIcon
            cell1.cardLengthLabel.text = card.cardRouteLengthLabel
            cell1.cardLengthMetricLabel.text = card.cardRouteLengthMetricLabel
            cell1.cardTimeIcon.image = card.cardRouteTimeIcon
            cell1.cardTimeLabel.text = card.cardRouteTimeLabel
            cell1.cardTimeMetricLabel.text = card.cardRouteTimeMetricLabel
            cell1.cardTransportIcon.image = card.cardTransportIcon
            cell1.cardTransportLabel.text = card.cardTransportLabel
            cell1.cardBeautyIcon.image = card.cardBeautyIcon
            cell1.cardBeautyLabel.text = card.cardBeautyLabel
            cell1.cardPollutionIcon.image = card.cardPollutionIcon
            cell1.cardPollutionLabel.text = card.cardPollutionLabel
            return cell1
        case .events:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ecell", for: indexPath) as! EventsCollectionViewCell
            cell2.cardPlacesImage.image = card.cardPlacesImage
            cell2.cardNameTitle.text = card.cardNameTitle
            cell2.cardLocationName.text = card.cardLocationName
            cell2.cardLocationIcon.image = card.cardLocationIcon
            cell2.cardEventDateIcon.image = card.cardEventDateIcon
            cell2.cardEventDateLabel.text = card.cardEventDateLabel
            cell2.cardEventTimeIcon.image = card.cardEventTimeIcon
            cell2.cardEventTimeLabel.text = card.cardEventTimeLabel
            return cell2
        case .garbagePoints:
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "gcell", for: indexPath) as! GarbagePointsCollectionViewCell
            cell3.cardPlacesImage.image = card.cardPlacesImage
            cell3.cardNameTitle.text = card.cardNameTitle
            cell3.cardLocationName.text = card.cardLocationName
            cell3.cardLocationIcon.image = card.cardLocationIcon
            cell3.cardPlasticIcon.image = card.cardTransportIcon
            cell3.cardWorkTimeIcon.image = card.cardWorkTimeIcon
            cell3.cardWorkTimeLabel.text = card.cardWorkTimeLabel
            cell3.cardPlasticIcon.image = card.cardPlasticIcon
            cell3.cardGlassIcon.image = card.cardGlassIcon
            cell3.cardBulbIcon.image = card.cardBulbIcon
            cell3.cardBatteriesIcon.image = card.cardBatteriesIcon
            cell3.cardPaperIcon.image = card.cardPaperIcon
            cell3.cardMetalIcon.image = card.cardMetalIcon
            return cell3
        }
    }
}

extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        let height = CGFloat(483)
        
        return CGSize(width: width, height: height)
    }
}


