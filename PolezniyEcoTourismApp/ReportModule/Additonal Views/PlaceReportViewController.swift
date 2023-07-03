//
//  PlaceReportViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/6/23.
//

import UIKit

protocol PlaceReportViewControllerDelegate: AnyObject {
    func didSelectOption(_ option: String, id: Int)
}

class PlaceReportViewController: UIViewController {
    
    weak var delegate: PlaceReportViewControllerDelegate?
    var selectedOption: String?
    var selectedOptionID: Int?
    var searchResults: [(name: String, id: Int)] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.layer.cornerRadius = 22
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setImage(UIImage(named: "doneIcon"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(doneActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let spacing: CGFloat = 8
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupTableView()
        setupPickerView()
        setupSearchBar()
    }
    
    private func setupView() {
        self.title = "Тип объекта"
        view.backgroundColor = UIColor(named: "Background")
    }
    
    private func setupLayout() {
        view.addSubview(pickerView)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pickerView.heightAnchor.constraint(equalToConstant: 135),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            searchBar.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 10),
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
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    // MARK: - Actions
    
    @objc func doneActionButton() {
        guard let selectedOption = selectedOption, let selectedOptionID = selectedOptionID else {
            return
        }

        delegate?.didSelectOption(selectedOption, id: selectedOptionID)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIPickerViewDelegate & UIPickerViewDataSource

extension PlaceReportViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Место"
        case 1:
            return "Маршрут"
        case 2:
            return "Мероприятие"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            selectedOption = "nature_object"
        case 1:
            selectedOption = "route"
        case 2:
            selectedOption = "event"
        default:
            selectedOption = nil
        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension PlaceReportViewController: UITableViewDelegate, UITableViewDataSource {
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
        selectedOptionID = selectedItem.id // Store the selected item's ID
    }
}

// MARK: - UISearchBarDelegate

extension PlaceReportViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let selectedOption = selectedOption,
              let searchTextEncoded = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        if searchText.isEmpty {
            searchResults.removeAll()
            tableView.reloadData()
            tableView.isHidden = true // Hide the table view when there is no search text
            return
        }
        
        var searchURL: URL?
        
        switch selectedOption {
        case "nature_object":
            searchURL = URL(string: "\(apiLink)/report/nature-objects-search-line/?search=\(searchTextEncoded)")
        case "route":
            searchURL = URL(string: "\(apiLink)/report/routes-search-line/?search=\(searchTextEncoded)")
        case "event":
            searchURL = URL(string: "\(apiLink)/report/events-search-line/?search=\(searchTextEncoded)")
        default:
            break
        }
        
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
                            if let name = dictionary["name"] as? String, let id = dictionary["pk"] as? Int {
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
