//
//  ActivityViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/16/23.
//

import UIKit

class ActivityViewController: UIViewController {
    
    private var reports: [Report] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        cv.backgroundColor = .none
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        loadData { (reports: [Report]?) in
            if let reports = reports {
                self.reports = reports
                self.collectionView.reloadData()
            } else {
                // Handle the case where the reports data is nil
                // ...
            }
        }
        
    }
    
    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register collection view cells
        collectionView.register(ReportsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func layout() {
        // Add scrollableTabView and collectionView to the view
        view.addSubview(collectionView)
        // Set constraints for collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
    
    // MARK: - Data
    
    func loadData(completion: @escaping ([Report]?) -> Void) {
        
        // Construct the URL with the placeID
        let urlString = "\(apiLink)/activities/reports/"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
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
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
                
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
                
                let reports = try decoder.decode([Report].self, from: data)
                DispatchQueue.main.async {
                    completion(reports)
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

// MARK: - UICollectionViewDelegate

extension ActivityViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - UICollectionViewDataSource

extension ActivityViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = reports[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReportsCollectionViewCell
        configureReportsCell(cell, with: card)
        return cell
    }
}

// MARK: - Cell Configuration

private func configureReportsCell(_ cell: ReportsCollectionViewCell, with card: Report) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .short
    
    cell.cardUsername.text = card.userID.username
    cell.cardDescription.text = card.description
    cell.cardTransportLabel.text = String(card.rates.availability)
    cell.cardBeautyLabel.text = String(card.rates.beauty)
    cell.cardPollutionLabel.text = String(card.rates.purity)
    
    let dateString = dateFormatter.string(from: card.createdAt)
    let components = dateString.components(separatedBy: ", ")
    if let date = components.first {
        cell.cardCreateData.text = date
    }
    
    if let time = components.last {
        cell.cardCreateTime.text = time
    }
    
    if let photoURLString = card.photo, let photoURL = URL(string: apiLink + photoURLString) {
        loadImage(from: photoURL, for: cell.cardReportImage)
    } else {
        cell.cardReportImage.image = UIImage(named: "noImage")
    }
}

// MARK: - Image Loading

private func loadImage(from url: URL, for imageView: UIImageView) {
    DispatchQueue.global().async {
        if let imageData = try? Data(contentsOf: url) {
            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                imageView.image = image
            }
        } else {
            DispatchQueue.main.async {
                imageView.image = UIImage(named: "noImage")
            }
        }
    }
}

extension ActivityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 16
        let height: CGFloat = 533
        let width = collectionView.frame.size.width - spacing
        return CGSize(width: width, height: height)
    }
}

