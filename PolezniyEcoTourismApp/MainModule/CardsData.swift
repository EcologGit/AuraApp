//
//  CardsData.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/14/22.
//

import UIKit

enum Category: Int, CustomStringConvertible, CaseIterable {
    case places = 0
    case routes
    case events
    case garbagePoints

    var description : String {
      switch self {
      case .places: return "МЕСТА"
      case .routes: return "МАРШРУТЫ"
      case .events: return "МЕРОПРИЯТИЯ"
      case .garbagePoints: return "ТОЧКИ СОРТИРОВКИ"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .places: return UIImage(systemName: "flag.fill")
        case .routes: return UIImage(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
        case .events: return UIImage(systemName: "party.popper.fill")
        case .garbagePoints: return UIImage(systemName: "trash.fill")
          }
      }
}

struct ExploreCardData {
    let cardNameTitle: String
    let category: Category
    let cardPlacesImage: UIImage?
    let cardLocationName: String
    let cardLocationIcon: UIImage?
    let cardTransportIcon: UIImage?
    let cardTransportLabel: String
    let cardBeautyIcon: UIImage?
    let cardBeautyLabel: String
    let cardPollutionIcon: UIImage?
    let cardPollutionLabel: String
    let cardStartIcon: UIImage?
    let cardStartLabel: String?
    let cardFinishIcon: UIImage?
    let cardFinishLabel: String?
    let cardRouteLengthIcon: UIImage?
    let cardRouteLengthLabel: String?
    let cardRouteLengthMetricLabel: String?
    let cardRouteTimeIcon: UIImage?
    let cardRouteTimeLabel: String?
    let cardRouteTimeMetricLabel: String?
    let cardEventDateIcon: UIImage?
    let cardEventDateLabel: String?
    let cardEventTimeIcon: UIImage?
    let cardEventTimeLabel: String?
    let cardWorkTimeIcon: UIImage?
    let cardWorkTimeLabel: String?
    let cardPlasticIcon: UIImage?
    let cardGlassIcon: UIImage?
    let cardBulbIcon: UIImage?
    let cardBatteriesIcon: UIImage?
    let cardPaperIcon: UIImage?
    let cardMetalIcon: UIImage?
}

var exploreCardData: [ExploreCardData] {
    var myExploreCardData: [ExploreCardData] = []
    
    myExploreCardData.append(ExploreCardData(cardNameTitle: "Name", category: .places, cardPlacesImage: UIImage(named: "NoImage")!, cardLocationName: "Locality", cardLocationIcon: UIImage(named: "locationIcon")!, cardTransportIcon: UIImage(named: "transportIcon")!, cardTransportLabel: "0,0", cardBeautyIcon: UIImage(named: "beautyIcon")!, cardBeautyLabel: "0,0", cardPollutionIcon: UIImage(named: "pollutionIcon")!, cardPollutionLabel: "0,0", cardStartIcon: UIImage(named: ""), cardStartLabel: "", cardFinishIcon: UIImage(named: ""), cardFinishLabel: "", cardRouteLengthIcon: UIImage(named: ""), cardRouteLengthLabel: "", cardRouteLengthMetricLabel: "", cardRouteTimeIcon: UIImage(named: ""), cardRouteTimeLabel: "", cardRouteTimeMetricLabel: "", cardEventDateIcon: UIImage(named: ""), cardEventDateLabel: "", cardEventTimeIcon: UIImage(named: ""), cardEventTimeLabel: "", cardWorkTimeIcon: UIImage(named: ""), cardWorkTimeLabel: "", cardPlasticIcon: UIImage(named: ""), cardGlassIcon: UIImage(named: ""), cardBulbIcon: UIImage(named: ""), cardBatteriesIcon: UIImage(named: ""), cardPaperIcon: UIImage(named: ""), cardMetalIcon: UIImage(named: "")))

    myExploreCardData.append(ExploreCardData(cardNameTitle: "Name", category: .routes, cardPlacesImage: UIImage(named: "NoImage")!, cardLocationName: "Start/Finish", cardLocationIcon: UIImage(named: "locationIcon")!, cardTransportIcon: UIImage(named: "transportIcon")!, cardTransportLabel: "0,0", cardBeautyIcon: UIImage(named: "beautyIcon")!, cardBeautyLabel: "0,0", cardPollutionIcon: UIImage(named: "pollutionIcon")!, cardPollutionLabel: "0,0", cardStartIcon: UIImage(named: "routeStartIcon"), cardStartLabel: "Start", cardFinishIcon: UIImage(named: "routeFinishIcon"), cardFinishLabel: "Finish", cardRouteLengthIcon: UIImage(named: "routeLengthIcon"), cardRouteLengthLabel: "0,0", cardRouteLengthMetricLabel: "км", cardRouteTimeIcon: UIImage(named: "routeTimeIcon"), cardRouteTimeLabel: "0,0", cardRouteTimeMetricLabel: "ч", cardEventDateIcon: UIImage(named: ""), cardEventDateLabel: "", cardEventTimeIcon: UIImage(named: ""), cardEventTimeLabel: "", cardWorkTimeIcon: UIImage(named: ""), cardWorkTimeLabel: "", cardPlasticIcon: UIImage(named: ""), cardGlassIcon: UIImage(named: ""), cardBulbIcon: UIImage(named: ""), cardBatteriesIcon: UIImage(named: ""), cardPaperIcon: UIImage(named: ""), cardMetalIcon: UIImage(named: "")))

    myExploreCardData.append(ExploreCardData(cardNameTitle: "Name", category: .events, cardPlacesImage: UIImage(named: "NoImage")!, cardLocationName: "Locality", cardLocationIcon: UIImage(named: "locationIcon"), cardTransportIcon: UIImage(named: ""), cardTransportLabel: "0,0", cardBeautyIcon: UIImage(named: ""), cardBeautyLabel: "0,0", cardPollutionIcon: UIImage(named: ""), cardPollutionLabel: "0,0", cardStartIcon: UIImage(named: ""), cardStartLabel: "", cardFinishIcon: UIImage(named: ""), cardFinishLabel: "", cardRouteLengthIcon: UIImage(named: ""), cardRouteLengthLabel: "", cardRouteLengthMetricLabel: "", cardRouteTimeIcon: UIImage(named: ""), cardRouteTimeLabel: "", cardRouteTimeMetricLabel: "", cardEventDateIcon: UIImage(named: "calendarIcon"), cardEventDateLabel: "01.01.2023", cardEventTimeIcon: UIImage(named: "timeIcon"), cardEventTimeLabel: "00:00", cardWorkTimeIcon: UIImage(named: ""), cardWorkTimeLabel: "", cardPlasticIcon: UIImage(named: ""), cardGlassIcon: UIImage(named: ""), cardBulbIcon: UIImage(named: ""), cardBatteriesIcon: UIImage(named: ""), cardPaperIcon: UIImage(named: ""), cardMetalIcon: UIImage(named: "")))

    myExploreCardData.append(ExploreCardData(cardNameTitle: "Name", category: .garbagePoints, cardPlacesImage: UIImage(named: "NoImage")!, cardLocationName: "Locality", cardLocationIcon: UIImage(named: "locationIcon")!, cardTransportIcon: UIImage(named: ""), cardTransportLabel: "", cardBeautyIcon: UIImage(named: ""), cardBeautyLabel: "", cardPollutionIcon: UIImage(named: ""), cardPollutionLabel: "", cardStartIcon: UIImage(named: ""), cardStartLabel: "", cardFinishIcon: UIImage(named: ""), cardFinishLabel: "", cardRouteLengthIcon: UIImage(named: ""), cardRouteLengthLabel: "", cardRouteLengthMetricLabel: "", cardRouteTimeIcon: UIImage(named: ""), cardRouteTimeLabel: "", cardRouteTimeMetricLabel: "", cardEventDateIcon: UIImage(named: ""), cardEventDateLabel: "", cardEventTimeIcon: UIImage(named: ""), cardEventTimeLabel: "", cardWorkTimeIcon: UIImage(named: "timeIcon"), cardWorkTimeLabel: "00:00 - 00:00", cardPlasticIcon: UIImage(named: "plasticIcon"), cardGlassIcon: UIImage(named: "glassIcon"), cardBulbIcon: UIImage(named: "bulbsIcon"), cardBatteriesIcon: UIImage(named: "batteriesIcon"), cardPaperIcon: UIImage(named: "papersIcon"), cardMetalIcon: UIImage(named: "metalsIcon")))


    return myExploreCardData
}
