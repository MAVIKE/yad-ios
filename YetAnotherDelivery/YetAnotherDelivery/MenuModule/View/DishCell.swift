import UIKit
import Kingfisher

class DishCell: UICollectionViewCell {
    static let identifier = "DishCell"
    
    var dish: Dish!
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 18
        return iv
    }()
    
    let mainLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.addCharacterSpacing(kernValue: 10)
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    let detailLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = lbl.font.withSize(12)
        lbl.numberOfLines = 0
        lbl.contentMode = .topLeft
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 0.5)
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    let orderButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(#colorLiteral(red: 0.7137254902, green: 0.05882352941, blue: 0.4274509804, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.7137254902, green: 0.05882352941, blue: 0.4274509804, alpha: 0.25), for: .highlighted)
        return btn
    }()
    
    public func setup(dish: Dish) {
        self.dish = dish
            
        setupView()
        setupImageView()
        setupMainLabel()
        setupPriceLabel()
        setupOrderButton()
        setupDetailLabel()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 18
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        if let url = URL(string: self.dish.imageUrlStr) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: "404")
        }
        
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupMainLabel() {
        addSubview(mainLabel)
        
        mainLabel.text = self.dish.title
        mainLabel.addCharacterSpacing(kernValue: 1.5)
        
        mainLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    private func setupDetailLabel() {
        addSubview(detailLabel)
        
        detailLabel.text = self.dish.description
        detailLabel.sizeToFit()
        detailLabel.addCharacterSpacing(kernValue: 0.75)
        detailLabel.setLineSpacing(lineSpacing: 4)
        
        detailLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 0).isActive = true
        detailLabel.leftAnchor.constraint(equalTo: mainLabel.leftAnchor, constant: 0).isActive = true
        detailLabel.rightAnchor.constraint(equalTo: mainLabel.rightAnchor, constant: 0).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 0).isActive = true
    }
    
    private func setupPriceLabel() {
        addSubview(priceLabel)

        priceLabel.text = "$ \(self.dish.price)"
        priceLabel.sizeToFit()

        priceLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: mainLabel.leftAnchor, constant: 0).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: mainLabel.rightAnchor, constant: 0).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupOrderButton() {
        addSubview(orderButton)
        
        orderButton.setTitle("Order", for: .normal)
        
        orderButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        orderButton.rightAnchor.constraint(equalTo: mainLabel.rightAnchor, constant: -10).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        orderButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
