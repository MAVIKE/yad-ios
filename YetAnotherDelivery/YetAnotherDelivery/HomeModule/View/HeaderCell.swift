import UIKit

class HeaderCell: UICollectionReusableView {
    static let identifier = "MenuHeaderCell"
    static let height = 75
    
    let label: YADLabel = {
        let lbl = YADLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    func setupView(title: String) {
        label.text = title
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
