//
//  TabBarConfigurator.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 10/30/22.
//

import UIKit

final class TabBarConfigurator {

    // MARK: - Private property

    private let allTab: [TabBarModel] = [.explore, .feed, .report, .favorite, .profile]

    // MARK: - Internal Methods

    func configure() -> UITabBarController {
        return getTabBarController()
    }
}

// MARK: - Private Methods

private extension TabBarConfigurator {

    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(named: "Green")
        tabBarController.tabBar.unselectedItemTintColor = UIColor(named: "DarkGrey")
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = getViewControllers()
        return tabBarController
    }

    func getViewControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        allTab.forEach { tab in
            let controller = getCurrentViewController(tab: tab)
            let navigationController = UINavigationController(rootViewController: controller)
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            controller.tabBarItem = tabBarItem
            controller.navigationController?.navigationBar.prefersLargeTitles = true
            controller.title = tab.title
            controller.view.backgroundColor = UIColor(named: "Background")
            viewControllers.append(navigationController)
        }
        return viewControllers
    }

    func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .explore:
            return ExploreViewController()
        case .feed:
            return ActivityViewController()
        case .report:
            return ReportViewController()
        case .favorite:
            return FavoritesViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
