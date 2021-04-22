import UIKit
import Kingfisher

class DishView: UIViewController {
    
    var presenter: DishOutputProtocol!
    
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
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.addCharacterSpacing(kernValue: 10)
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    let orderButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.8304319978, green: 0.8244299293, blue: 0.8350281119, alpha: 1), for: .highlighted)
        btn.layer.cornerRadius = 12
        btn.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupLayout()
        setupImage()
        setupTitle()
        setupButton()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white    }
    
    private func setupImage() {
        view.addSubview(imageView)
        
        if let url = URL(string: presenter.getDish().imageUrlStr) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: "404")
        }
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 0).isActive = true
    }
    
    private func setupTitle() {
        view.addSubview(mainLabel)
        
        mainLabel.text = presenter.getDish().title
        
        mainLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 12).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -12).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupButton() {
        view.addSubview(orderButton)
        
        orderButton.setTitle("Заказать ₽ \(presenter.getDish().price)", for: .normal)
        orderButton.addTarget(self, action: #selector(orderButtonTapped(sender:)), for: .touchUpInside)
        
        orderButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4).isActive = true
        orderButton.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 12).isActive = true
        orderButton.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -12).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc
    func orderButtonTapped(sender: Any) {
        print("Ordered")
    }
}

extension DishView: DishInputProtocol {
    
}
