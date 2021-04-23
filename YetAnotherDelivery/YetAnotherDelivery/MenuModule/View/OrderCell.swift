//
//  OrderCell.swift
//  YetAnotherDelivery
//
//  Created by Антон Тимонин on 22.04.2021.
//

import UIKit

class OrderCell: UICollectionViewCell {
    static let identifier = "OrderCell"
    
    let priceLabel: YADLabel = {
        let lbl = YADLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.addCharacterSpacing(kernValue: 10)
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return lbl
    }()
    
    public func setup(count: Int) {
        
        setupLayout()
        setupLabel(count)
    }
    
    private func setupLayout() {
        layer.cornerRadius = 18
        backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        layer.cornerRadius = 18
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
    }
    
    private func setupLabel(_ count: Int) {
        addSubview(priceLabel)
        
        priceLabel.text = "Корзина: \(count)"
        
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
