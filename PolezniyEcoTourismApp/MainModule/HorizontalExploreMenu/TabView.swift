//
//  TabView.swift
//  PolezniyEcoTourismApp
//
//  Created by Aleksandr Chebotarev on 11/14/22.
//

import UIKit

public class TabView: UIView {
    public let label = UILabel()
    public var image = UIImageView()
    
    let activeColor: UIColor
    let inactiveColor: UIColor
    
    let activeBgColor: UIColor
    let inactiveBgColor: UIColor
    
    var active: Bool = false {
        didSet {
            self.backgroundColor = self.active ? self.activeBgColor : self.inactiveBgColor
            self.label.textColor = self.active ? self.activeColor : self.inactiveColor
            self.image.tintColor = self.active ? self.activeColor : self.inactiveColor
        }
    }
    
    public init(activeColor: UIColor, inactiveColor: UIColor, activeBgColor: UIColor, inactiveBgColor: UIColor) {
        
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        
        self.activeBgColor = activeBgColor
        self.inactiveBgColor = inactiveBgColor
        
        super.init(frame: .zero)
        
        label.textColor = inactiveColor
        label.font = FontKit.roundedFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = inactiveColor
        image.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 22
        addSubview(label)
        addSubview(image)
        
        setCategoryConstraint()
    }
    
    private func setCategoryConstraint() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            image.rightAnchor.constraint(equalTo: label.leftAnchor, constant: -8),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            image.heightAnchor.constraint(equalToConstant: 10),
            image.widthAnchor.constraint(equalToConstant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            
            label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 13.5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
