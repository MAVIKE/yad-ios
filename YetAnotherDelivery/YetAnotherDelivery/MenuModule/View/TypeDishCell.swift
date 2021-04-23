//
//  TypeDishCell.swift
//  YetAnotherDelivery
//
//  Created by Антон Тимонин on 18.04.2021.
//

import UIKit

class TypeDishCell: UICollectionViewCell {
    static let identifier = "TypeDishCell"
    
    var typeDish: TypeDish!
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
//        iv.layer.cornerRadius = 18
        return iv
    }()
    
    let mainLabel: YADLabel = {
        let lbl = YADLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.addCharacterSpacing(kernValue: 10)
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return lbl
    }()
    
    public func setup(typeDish: TypeDish) {
        self.typeDish = typeDish
        
        setupLayout()
        setupTitle()
        setupImage()
    }
    
    private func setupLayout() {
        self.layer.cornerRadius = 18
        self.backgroundColor = #colorLiteral(red: 0.7835444808, green: 0.06174802035, blue: 0.4786840081, alpha: 1)
        layer.cornerRadius = 18
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
    }
    
    private func setupTitle() {
        addSubview(mainLabel)
        
        mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        mainLabel.text = typeDish.nameType
    }
    
    private func setupImage() {
        addSubview(imageView)
        
        imageView.image = UIImage(named: typeDish.nameImage.rawValue)
        
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -6).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 0).isActive = true
    }
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
