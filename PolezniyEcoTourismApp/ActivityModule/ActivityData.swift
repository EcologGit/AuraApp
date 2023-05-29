//
//  ActivityData.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/17/23.
//

import UIKit

enum ActivityCategory: Int, CustomStringConvertible, CaseIterable {
    case reports = 0
    case tops

    var description : String {
      switch self {
      case .reports: return "ОТЧЕТЫ"
      case .tops: return "ТОПЫ"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .reports: return UIImage(systemName: "flag.fill")
        case .tops: return UIImage(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
          }
      }
}
