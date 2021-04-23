import UIKit

class MenuSelectionCell: UICollectionViewCell {
    static let identifier = "MenuSelectionCell"
    
    let label: YADLabel = {
        let lbl = YADLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 26)
        lbl.backgroundColor = .white
        lbl.clipsToBounds = true
        lbl.layer.cornerRadius = 18
        lbl.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return lbl
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 18
        return iv
    }()
    
    func setup(imageUrl: String, title: String) {
        setupView()
        setupImageView(imageUrl)
        setupLabel(title)
    }
    
    private func setupView() {
        layer.cornerRadius = 18
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
    }
    
    private func setupImageView(_ imageUrl: String) {
        addSubview(imageView)
        imageView.image = UIImage(named: "kroshka")
        
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLabel(_ title: String) {
        label.text = "    \(title)"
        
        addSubview(label)
        
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
