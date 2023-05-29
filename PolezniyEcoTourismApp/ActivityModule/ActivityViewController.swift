//
//  ActivityViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/16/23.
//

import UIKit

class ActivityViewController: UIViewController {
    
    let scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return view
    }()
    
    var selectedCategory: ActivityCategory = .reports
    
    var tabTiles: [TabView] {
        ActivityCategory.allCases.map {
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
        
        layout()
        loadData()
    }
    
    
    func layout() {
        view.addSubview(scrollableTabView)
        scrollableTabView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        scrollableTabView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: scrollableTabView.trailingAnchor, multiplier: 1).isActive = true
    }
    
    func loadData() {
        scrollableTabView.setup(tabs: tabTiles, selectedIndex: 0)
    }
}
// MARK: - ScrollableTabViewDelegate

extension ActivityViewController: ScrollableTabViewDelegate {
    
    /// When tab is tapped reload data.
    func scrollableTabView(_ tabView: ScrollableTabView, didTapTabAt index: Int) {

        guard index < ActivityCategory.allCases.count else { return }
        selectedCategory = ActivityCategory.allCases.filter { $0.rawValue == index }.first!

    }
}
