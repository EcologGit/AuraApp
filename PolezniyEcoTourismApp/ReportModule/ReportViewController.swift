//
//  ReportViewController.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 5/16/23.
//

import UIKit

class ReportViewController: UIViewController {
    
    let scrollableTabView: ScrollableTabView = {
        let view = ScrollableTabView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return view
    }()
}
