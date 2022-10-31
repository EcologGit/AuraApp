//
//  TabBarModel.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 10/30/22.
//

import UIKit

enum TabBarModel {
    case explore
    case feed
    case report
    case favorite
    case profile

    var title: String {
        switch self {
        case .explore:
            return "Обзор"
        case .feed:
            return "Лента"
        case .report:
            return "Отчет"
        case .favorite:
            return "Отметки"
        case .profile:
            return "Профиль"
        }
    }

    var image: UIImage? {
        switch self {
        case .explore:
            return UIImage(systemName: "safari.fill")
        case .feed:
            return UIImage(systemName: "bolt.horizontal.circle.fill")
        case .report:
            return UIImage(systemName: "plus.circle.fill")
        case .favorite:
            return UIImage(systemName: "bookmark.circle.fill")
        case .profile:
            return UIImage(systemName: "person.circle.fill")
        }
    }

    var selectedImage: UIImage? {
        return image
    }
    
}
