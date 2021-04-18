//
//  PrototypeDishCell.swift
//  YetAnotherDelivery
//
//  Created by Антон Тимонин on 18.04.2021.
//

import UIKit

class PrototypeDishCell: UICollectionViewCell {
    static let identifier = "PrototypeDishCell"
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
