//
//  Parser.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/17/23.
//

import UIKit

//class Parser {
//    static let shared = Parser()
//
//    // Function to parse the JSON data for places and routes
//    func parseData<T: Codable>(from url: URL, completion: @escaping ([T]?) -> Void) {
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("Error fetching data: \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                  httpResponse.statusCode == 200,
//                  let data = data else {
//                print("Invalid response")
//                completion(nil)
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//                decoder.dateDecodingStrategy = .formatted(dateFormatter)
//                let parsedData = try decoder.decode([T].self, from: data)
//                DispatchQueue.main.async {
//                    completion(parsedData)
//                }
//            } catch {
//                print("Error decoding JSON: \(error.localizedDescription)")
//                completion(nil)
//            }
//        }
//
//        task.resume()
//    }
//}

class Parser {
    static let shared = Parser()
    
    // Function to parse the JSON data for places, routes, and events
    func parseData<T: Codable>(from url: URL, completion: @escaping ([T]?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                print("Invalid response")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                // Create a custom decoding strategy
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                // Separate the date and time components
                decoder.dateDecodingStrategy = .custom { decoder -> Date in
                    let container = try decoder.singleValueContainer()
                    let dateString = try container.decode(String.self)
                    if let date = dateFormatter.date(from: dateString) {
                        return date
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid date format: \(dateString)"
                        )
                    }
                }
                
                let parsedData = try decoder.decode([T].self, from: data)
                DispatchQueue.main.async {
                    completion(parsedData)
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

