//
//  CardsData.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/14/22.
//

import UIKit

protocol ExploreCardData {
    var category: Category { get }
}

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
//MARK: - Models properties
var explorePlaceCardData: [ExplorePlaceCardData] = []
var exploreRouteCardData: [ExploreRouteCardData] = []
var exploreEventCardData: [ExploreEventCardData] = []
var exploreGarbagePointCardData: [ExploreGarbagePointCardData] = []

//MARK: - Places Model
struct Place: Codable {
    let objectID: Int
    let name, description, locality: String
    let photo: String?
    let avgAvailability, avgBeauty, avgPurity: Double?
    
    enum CodingKeys: String, CodingKey {
        case objectID = "object_id"
        case name, description, locality
        case photo
        case avgAvailability = "avg_availability"
        case avgBeauty = "avg_beauty"
        case avgPurity = "avg_purity"
    }
}

struct ExplorePlaceCardData: ExploreCardData {
    let place: Place
    let category: Category
    let cardLocationIcon: UIImage = UIImage(named: "locationIcon")!
    let cardTransportIcon: UIImage = UIImage(named: "transportIcon")!
    let cardBeautyIcon: UIImage = UIImage(named: "beautyIcon")!
    let cardPollutionIcon: UIImage = UIImage(named: "pollutionIcon")!
}
struct PlaceDetail: Codable {
    let objectInfo: PlaceInfo
    let placeReportsStatistic: [PlaceReportStatistic]

    enum CodingKeys: String, CodingKey {
        case objectInfo = "object_info"
        case placeReportsStatistic = "reports_statistic"
    }
}

// MARK: - PlaceInfo
struct PlaceInfo: Codable {
    let locality: String
    let objectID: Int
    let name, description, latitudeN: String
    let photo: String?
    let longitudeE: String
    let avgAvailability, avgBeauty, avgPurity: Double?

    enum CodingKeys: String, CodingKey {
        case locality
        case objectID = "object_id"
        case name, description
        case photo
        case latitudeN = "latitude_n"
        case longitudeE = "longitude_e"
        case avgAvailability = "avg_availability"
        case avgBeauty = "avg_beauty"
        case avgPurity = "avg_purity"
    }
}

struct PlaceReportStatistic: Codable {
    // Define properties for report statistic if needed
}
//MARK: - Routes Model
struct Route: Codable {
    let routeID: Int
    let name, locality: String
    let length: Double?
    let duration: String
    let photo: String?
    let avgAvailability, avgBeauty, avgPurity: Double?
    
    enum CodingKeys: String, CodingKey {
        case routeID = "route_id"
        case length
        case name, photo, locality, duration
        case avgAvailability = "avg_availability"
        case avgBeauty = "avg_beauty"
        case avgPurity = "avg_purity"
    }
}

struct ExploreRouteCardData: ExploreCardData {
    let route: Route
    let category: Category
    let cardLocationIcon: UIImage = UIImage(named: "locationIcon")!
    let cardRouteLengthIcon: UIImage = UIImage(named: "routeLengthIcon")!
    let cardRouteLengthMetricLabel: String = "км"
    let cardRouteTimeIcon: UIImage = UIImage(named: "routeTimeIcon")!
    let cardRouteTimeMetricLabel: String = "ч"
    let cardTransportIcon: UIImage = UIImage(named: "transportIcon")!
    let cardBeautyIcon: UIImage = UIImage(named: "beautyIcon")!
    let cardPollutionIcon: UIImage = UIImage(named: "pollutionIcon")!
}

// MARK: - RoutesDetails
struct RoutesDetail: Codable {
    let objectInfo: RouteInfo
    let routeReportsStatistic: [RouteReportStatistic]

    enum CodingKeys: String, CodingKey {
        case objectInfo = "object_info"
        case routeReportsStatistic = "reports_statistic"
    }
}

// MARK: - ObjectInfo
struct RouteInfo: Codable {
    let pk: Int
    let name, duration, locality: String
    let length: Int
    let description, startN, startE, endN: String
    let endE: String
    let avgAvailability, avgBeauty, avgPurity: Double?
    let photo: String?

    enum CodingKeys: String, CodingKey {
        case pk, name, duration, length, description, locality
        case startN = "start_n"
        case startE = "start_e"
        case endN = "end_n"
        case endE = "end_e"
        case avgAvailability = "avg_availability"
        case avgBeauty = "avg_beauty"
        case avgPurity = "avg_purity"
        case photo
    }
}

struct RouteReportStatistic: Codable {
    // Define properties for report statistic if needed
}
//MARK: - Events Model
struct Event: Codable {
    let name: String
    let photo: String?
    let description: String
    let eventID: Int
    let datetimeStart: Date
    let status, adress: String

    enum CodingKeys: String, CodingKey {
        case name, photo, description
        case eventID = "event_id"
        case datetimeStart = "datetime_start"
        case status, adress
    }
}

struct ExploreEventCardData: ExploreCardData {
    let event: Event
    let category: Category
    let cardLocationIcon: UIImage = UIImage(named: "locationIcon")!
    let cardEventDateIcon: UIImage = UIImage(named: "calendarIcon")!
    let cardEventTimeIcon: UIImage = UIImage(named: "timeIcon")!
}
//MARK: - EventsDetail
struct EventsDetail: Codable {
    let pk: Int
    let name: String
    let timeStart, timeOfClose: Date
    let statusID: StatusID
    let description, adress: String
    let photo: String?
    let natureObjects: [NatureObject]?
    let routes: [NatureObject]?
    let avgAvailability, avgBeauty, avgPurity: Double?
    let reportsStatistic: [EventsReportStatistic]?

    enum CodingKeys: String, CodingKey {
        case pk, name
        case timeStart = "time_start"
        case timeOfClose = "time_of_close"
        case statusID = "status_id"
        case description, adress
        case photo
        case natureObjects = "nature_objects"
        case routes
        case avgAvailability = "avg_availability"
        case avgBeauty = "avg_beauty"
        case avgPurity = "avg_purity"
        case reportsStatistic = "reports_statistic"
    }
}

// MARK: - NatureObject
struct NatureObject: Codable {
    let name, locality: String
}

// MARK: - StatusID
struct StatusID: Codable {
    let name: String
}

//MARK: - ReportStatistis
struct EventsReportStatistic: Codable {
    // Define properties for report statistic if needed
}

//MARK: - Garbage Points Model
struct GarbagePoint: Codable {
    let pointID: Int
    let photo: String?
    let name, description, locality, schedule: String
    let wastTypes: [WastType]
    
    enum CodingKeys: String, CodingKey {
        case pointID = "point_id"
        case name, description, locality, schedule
        case photo
        case wastTypes = "wast_types"
    }
}
struct WastType: Codable {
    let name: String
}
struct ExploreGarbagePointCardData: ExploreCardData {
    let garbagePoint: GarbagePoint
    let category: Category
    let cardLocationIcon: UIImage = UIImage(named: "locationIcon")!
    let cardWorkTimeIcon: UIImage = UIImage(named: "timeIcon")!
    let cardPlasticIcon: UIImage = UIImage(named: "plasticIcon")!
    let cardGlassIcon: UIImage = UIImage(named: "glassIcon")!
    let cardBulbIcon: UIImage = UIImage(named: "bulbsIcon")!
    let cardBatteriesIcon: UIImage = UIImage(named: "batteriesIcon")!
    let cardPaperIcon: UIImage = UIImage(named: "papersIcon")!
    let cardMetalIcon: UIImage = UIImage(named: "metalsIcon")!
}

struct GarbagePointDetails: Codable {
    let photo: String?
    let pk: Int
    let name, schedule, description, locality: String
    let latitudeN, longitudeE: String
    let wastTypes: [WastType]

    enum CodingKeys: String, CodingKey {
        case pk, name, schedule, description, locality
        case photo
        case latitudeN = "latitude_n"
        case longitudeE = "longitude_e"
        case wastTypes = "wast_types"
    }
}

