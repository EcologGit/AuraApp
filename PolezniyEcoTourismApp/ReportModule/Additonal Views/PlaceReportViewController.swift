//
//  PlaceReportViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 6/6/23.
//

import UIKit

class PlaceReportViewController: UIViewController {
    
    var completion: ((String) -> Void)?
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Объект, маршрут или мероприятие"
        textView.textColor = UIColor.lightGray
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets(top: 12.5, left: 16, bottom: 12.5, right: 16)
        return textView
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
        self.title = "Место уборки"
        view.backgroundColor = UIColor(named: "Background")
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(descriptionTextView)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 45),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            doneButton.heightAnchor.constraint(equalToConstant: 44),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            
        ])
        
    }
    
    @objc func doneActionButton() {
        let enteredTitle = descriptionTextView.text ?? ""
        completion?(enteredTitle)
        dismiss(animated: true, completion: nil)
    }
}
