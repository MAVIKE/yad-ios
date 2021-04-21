//
//  TypeDishCell.swift
//  YetAnotherDelivery
//
//  Created by Антон Тимонин on 18.04.2021.
//

import UIKit

class TypeDishCell: UICollectionViewCell {
    static let identifier = "TypeDishCell"
    
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public func setup() {
        backgroundColor = .systemPink
        
        addSubview(backView)
        
        backView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        backView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        backView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
