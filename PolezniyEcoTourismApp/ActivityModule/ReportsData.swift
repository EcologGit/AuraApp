//
//  ReportsData.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/10/23.
//

import Foundation

// MARK: - Report
struct Report: Codable {
    let description: String
    let pk: Int
    let photo: String?
    let createdAt: Date
    let userID: UserID
    let results: [Result]
    let obj: Obj
    let rates: Rates

    enum CodingKeys: String, CodingKey {
        case description, pk, photo
        case createdAt = "created_at"
        case userID = "user_id"
        case results, obj, rates
    }
}

// MARK: - Obj
struct Obj: Codable {
    let name, locality, typeObj: String

    enum CodingKeys: String, CodingKey {
        case name, locality
        case typeObj = "type_obj"
    }
}

// MARK: - Rates
struct Rates: Codable {
    let availability, beauty, purity: Int
}

// MARK: - Result
struct Result: Codable {
    let amount: String
    let wasteID: WasteID

    enum CodingKeys: String, CodingKey {
        case amount
        case wasteID = "waste_id"
    }
}

// MARK: - WasteID
struct WasteID: Codable {
    let name, unitOfWaste: String

    enum CodingKeys: String, CodingKey {
        case name
        case unitOfWaste = "unit_of_waste"
    }
}

// MARK: - UserID
struct UserID: Codable {
    let username: String
    let pk: Int
}
