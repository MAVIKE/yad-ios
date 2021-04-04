import UIKit

class CollectionReusableView: UICollectionReusableView {
    static let identifier = "CollectionReusableView"
    static let height = 75
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Популярные рестораны"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    func setupView() {
        setupLabel()
    }
    
    private func setupLabel() {
        addSubview(label)
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -22).isActive = true
    }
}
