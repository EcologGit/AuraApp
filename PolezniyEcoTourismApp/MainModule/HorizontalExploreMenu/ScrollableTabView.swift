//
//  ScrollableTabView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/14/22.
//

import UIKit

public protocol ScrollableTabViewDelegate: AnyObject {
    func scrollableTabView(_ tabView: ScrollableTabView, didTapTabAt index: Int)
}

public class ScrollableTabView: UIView {

    let scrollView = UIScrollView()
    var tabs: [TabView] = []
    
    public weak var delegate: ScrollableTabViewDelegate?

    public func setup(tabs: [TabView], selectedIndex: Int) {

        for view in scrollView.subviews {
            view.removeFromSuperview()
        }

        self.tabs = tabs

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false

        addSubview(scrollView)
        
        for (index, tab) in tabs.enumerated() {
            scrollView.addSubview(tab)

            tab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabWasTapped(_:))))

            NSLayoutConstraint.activate([
                tab.topAnchor.constraint(equalTo: scrollView.topAnchor),
            ])

            let horizontalSpacing: CGFloat = 2.0

            if index == 0 {
                NSLayoutConstraint.activate([
                    tab.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: horizontalSpacing * 0.5)
                ])
            } else if index == tabs.count - 1 {
                NSLayoutConstraint.activate([
                    tab.leadingAnchor.constraint(equalToSystemSpacingAfter: tabs[index - 1].trailingAnchor, multiplier: horizontalSpacing),
                    scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: tab.trailingAnchor, multiplier: horizontalSpacing * 0.5)
                ])
            } else {
                NSLayoutConstraint.activate([
                    tab.leadingAnchor.constraint(equalToSystemSpacingAfter: tabs[index - 1].trailingAnchor, multiplier: horizontalSpacing)
                ])
            }
        }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            topAnchor.constraint(equalTo: scrollView.topAnchor),
            bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

        select(selectedIndex, animated: false)
    }

    @objc func tabWasTapped(_ recognizer: UIGestureRecognizer) {

        guard let tabView = recognizer.view as? TabView,
            let index = tabs.firstIndex(of: tabView) else {
                return
        }

        select(index)
    }

    public func select(_ tabIndex: Int, animated: Bool = true) {
        
        for tab in tabs {
            tab.active = false
        }

        let selectedTab = tabs[tabIndex]
        selectedTab.active = true

        animateSelectedTabToCenter(selectedTab)

        delegate?.scrollableTabView(self, didTapTabAt: tabIndex)
    }

    private func animateSelectedTabToCenter(_ selectedTab: TabView) {
        
        // potentialOffset - the amount would could potentially scroll from the middle
        // leftmostBounds  - the furthest to the left we could scroll (0 = no scrolling)
        // rightmostBounds - the furthest to the right we could ever scroll
        
        let potentialOffset = selectedTab.frame.midX - (scrollView.bounds.width * 0.5)
        
        let actualOffset: CGFloat

        let leftmostBounds: CGFloat = 0
        let rightmostBounds = scrollView.contentSize.width - (scrollView.bounds.width)
        
        if potentialOffset < leftmostBounds {           // Left side
            actualOffset = leftmostBounds
        } else if potentialOffset > rightmostBounds {   // Right side
            actualOffset = rightmostBounds
        } else {                                        // Middle area
            actualOffset = potentialOffset
        }
        
        // animation handled here
        scrollView.setContentOffset(CGPoint(x: actualOffset, y: 0.0), animated: true)
    }


}
