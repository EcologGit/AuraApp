//
//  PointReportViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/6/23.
//

import UIKit

protocol PointReportDelegate: AnyObject {
    func didSelectPoint(_ pointId: Int)
}

class PointReportViewController: UIViewController {
    
    weak var pointDelegate: PointReportDelegate?
    var selectedName: String?
    var selectedID: Int?
    var searchResults: [(name: String, id: Int)] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Название"
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .black
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 22
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("ГОТОВО", for: .normal)
        button.backgroundColor = UIColor(named: "Green")
        button.layer.cornerRadius = 22
        button.setTitleColor(UIColor(named: "DarkGrey"), for: .normal)
        button.titleLabel?.font = FontKit.roundedFont(ofSize: 17, weight: .semibold)
        button.setImage(UIImage(named: "doneIcon"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(doneActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 8
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupTableView()
        setupSearchBar()
    }
    
    private func setupView() {
        self.title = "Точка сортировки"
        view.backgroundColor = UIColor(named: "Background")
    }
    
    private func setupLayout() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -16),
            
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            doneButton.heightAnchor.constraint(equalToConstant: 44),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            
        ])
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    @objc func doneActionButton() {
        guard let selectedID = selectedID else { return }
        pointDelegate?.didSelectPoint(selectedID)
        print(selectedID)
        dismiss(animated: true, completion: nil) // Return to the ReportViewController screen
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension PointReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = searchResults[indexPath.row].name
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = searchResults[indexPath.row]
        searchBar.text = selectedItem.name // Set the selected item as the search bar text
        selectedID = selectedItem.id
    }
}

// MARK: - UISearchBarDelegate

extension PointReportViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTextEncoded = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        if searchText.isEmpty {
            searchResults.removeAll()
            tableView.reloadData()
            tableView.isHidden = true // Hide the table view when there is no search text
            return
        }
        
        let searchURL = URL(string: "\(apiLink)/review/sortPoints/?search=\(searchTextEncoded)")
        
        if let searchURL = searchURL {
            URLSession.shared.dataTask(with: searchURL) { [weak self] data, response, error in
                if let error = error {
                    print("API request error: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("API response data is nil")
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonArray = json as? [[String: Any]] {
                        let results = jsonArray.compactMap { dictionary -> (name: String, id: Int)? in
                            if let name = dictionary["name"] as? String, let id = dictionary["point_id"] as? Int {
                                return (name, id)
                            }
                            return nil
                        }
                        let filteredResults = results.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
                        DispatchQueue.main.async {
                            self?.searchResults = filteredResults
                            self?.tableView.reloadData()
                            self?.tableView.isHidden = false // Show the table view when there is search text
                        }
                    }
                } catch {
                    print("Failed to parse API response JSON: \(error)")
                }
            }.resume()
        }
    }
}

