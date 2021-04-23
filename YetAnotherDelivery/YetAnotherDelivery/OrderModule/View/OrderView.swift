import UIKit

class OrderView: UIViewController {
    lazy var DishCellSize = CGSize(width: self.view.frame.width - 36, height: 120)
    
    // MARK:- Presenter
    public var presenter: OrderOutputProtocol!
    
    let collectionView: UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        
        // CollectionView
        let cw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cw.showsVerticalScrollIndicator = false
        cw.backgroundColor = .white
        cw.translatesAutoresizingMaskIntoConstraints = false
        return cw
    }()
    
    let totalLabel: YADLabel = {
        let lbl = YADLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.addCharacterSpacing(kernValue: 10)
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    let priceLabel: YADLabel = {
        let lbl = YADLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.addCharacterSpacing(kernValue: 10)
        lbl.textColor = #colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1)
        return lbl
    }()
    
    let placeOrderView: YADView = {
        let view = YADView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let makeOrderButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.7333333333, blue: 0, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.setTitleColor(#colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2549019608, green: 0.05490196078, blue: 0.5098039216, alpha: 0.25), for: .highlighted)
        btn.layer.cornerRadius = 13
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupLayout()
        setupNavigation()
        setupView()
        setupCollectionView()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.7333333333, blue: 0, alpha: 1)
        navigationController?.navigationBar.topItem?.title = "Yet Another Delivery"
    }
    
    private func setupView() {
        view.addSubview(placeOrderView)
        
        placeOrderView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        placeOrderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        placeOrderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        placeOrderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        setupLabels()
        setupMakeOrderButton()
    }
    
    private func setupLabels() {
        let currentView = placeOrderView
        
        currentView.addSubview(totalLabel)
        currentView.addSubview(priceLabel)
        
        totalLabel.text = "Итого:"
        priceLabel.text = "₽ \("120.0")"
        
        totalLabel.topAnchor.constraint(equalTo: currentView.topAnchor, constant: 10).isActive = true
        totalLabel.leftAnchor.constraint(equalTo: currentView.leftAnchor, constant: 24).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: currentView.topAnchor, constant: 10).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: currentView.rightAnchor, constant: -24).isActive = true
    }
    
    private func setupMakeOrderButton() {
        let currentView = placeOrderView
        
        currentView.addSubview(makeOrderButton)
        
        makeOrderButton.setTitle("Заказать", for: .normal)
        
        makeOrderButton.leftAnchor.constraint(equalTo: currentView.leftAnchor, constant: 10).isActive = true
        makeOrderButton.rightAnchor.constraint(equalTo: currentView.rightAnchor, constant: -10).isActive = true
        makeOrderButton.bottomAnchor.constraint(equalTo: currentView.bottomAnchor, constant: -12).isActive = true
        makeOrderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(DishOrderCell.self, forCellWithReuseIdentifier: DishOrderCell.identifier)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: placeOrderView.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    }
}

extension OrderView: OrderInputProtocol {
    
}

extension OrderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return DishCellSize
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

extension OrderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(HeaderCell.height))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            
            reusableview.frame = CGRect(x: 0 , y: 0, width: Int(view.frame.width), height: HeaderCell.height)
            reusableview.setupView(title: "Заказ")
            return reusableview
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        presenter.didRestaurantTapped()
    }
}

extension OrderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getDishes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishOrderCell.identifier, for: indexPath) as! DishOrderCell
            let dish = presenter.getDishes()[indexPath.row]
            cell.setup(dish: dish)
            return cell
        default:
            fatalError("Unexpected element kind")
        }
    }
}
