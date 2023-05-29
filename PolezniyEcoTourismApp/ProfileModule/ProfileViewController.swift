//
//  ProfileViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/16/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return view
    }()
}
