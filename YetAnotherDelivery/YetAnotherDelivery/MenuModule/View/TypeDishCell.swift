//
//  TypeDishCell.swift
//  YetAnotherDelivery
//
//  Created by Антон Тимонин on 18.04.2021.
//

import UIKit

class TypeDishCell: UICollectionViewCell {
    static let identifier = "TypeDishCell"
    
    
    public func setup() {
        backgroundColor = .systemPink
    }
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
