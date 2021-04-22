import UIKit

class MenuView: UIViewController {
    lazy var PrototypeDishCellSize = CGSize(width: self.view.frame.width, height: 76)
    lazy var DishCellSize = CGSize(width: self.view.frame.width - 36, height: 120)
    lazy var OrderCellSize = CGSize(width: self.view.frame.width - 36, height: 65)
    lazy var TypeDishCellSize = CGSize(width: 120, height: 76)
    
    var presenter: MenuOutputProtocol!
    
    let typeDishesCollectionView: UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        
        // CollectionView
        let cw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cw.backgroundColor = .white
        cw.translatesAutoresizingMaskIntoConstraints = false
        cw.showsHorizontalScrollIndicator = false
        return cw
    }()
    
    let mainCollectionView: UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        
        // CollectionView
        let cw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cw.backgroundColor = .white
        cw.translatesAutoresizingMaskIntoConstraints = false
        cw.showsVerticalScrollIndicator = false
        return cw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        
//        let indexPath = IndexPath(item: 1, section: 0)
//        mainCollectionView.reloadItems(at: [indexPath])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.presenter.plus()
            self.mainCollectionView.reloadItems(at: [IndexPath(item: 0, section: 1)])
        }
    }
    
    private func setup() {
        setupNavigation()
        setupCollectionView()
    }
    
    private func setupNavigation() {
        navigationController?.view.backgroundColor = .green
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.7333333333, blue: 0, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Yet Another Delivery"
    }
    
    private func setupCollectionView(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        typeDishesCollectionView.delegate = self
        typeDishesCollectionView.dataSource = self
        
        mainCollectionView.register(PrototypeDishCell.self, forCellWithReuseIdentifier: PrototypeDishCell.identifier)
        mainCollectionView.register(DishCell.self, forCellWithReuseIdentifier: DishCell.identifier)
        mainCollectionView.register(OrderCell.self, forCellWithReuseIdentifier: OrderCell.identifier)
        mainCollectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        typeDishesCollectionView.register(TypeDishCell.self, forCellWithReuseIdentifier: TypeDishCell.identifier)
        typeDishesCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UICollectionReusableView")
        
        self.view.addSubview(mainCollectionView)
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        mainCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    public func updateCollectionViews() {
        self.mainCollectionView.reloadData()
        self.typeDishesCollectionView.reloadData()
    }
}

extension MenuView: MenuInputProtocol {
    
}

extension MenuView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.mainCollectionView {
            switch indexPath.section {
            case 0:
                return PrototypeDishCellSize
            case 1:
                return OrderCellSize
            case 2:
                return DishCellSize
            default:
                return CGSize(width: 25, height: 25)
            }
        } else if collectionView == self.typeDishesCollectionView {
            return TypeDishCellSize
        }
        return CGSize(width: 25, height: 25)
    }
}

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.typeDishesCollectionView {
            return UIEdgeInsets(top: 0.0, left: 17.5, bottom: 0.0, right: 0.0)
        }
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == self.mainCollectionView {
            switch section {
            case 0:
                return CGSize(width: collectionView.frame.width, height: CGFloat(HeaderCell.height))
            default:
                return CGSize(width: collectionView.frame.width, height: 25)
            }
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == self.mainCollectionView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
                
                reusableview.frame = CGRect(x: 0 , y: 0, width: Int(view.frame.width), height: HeaderCell.height)
                
                reusableview.setupView(title: "Крошка картошка")
                return reusableview
            default:
                fatalError("Unexpected element kind")
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.mainCollectionView {
            switch indexPath.section {
            case 1:
                print("1")
            case 2:
                presenter.didDishTapped(dish: presenter.getDishes()[indexPath.item])
            default:
                print("Default tap")
            }
            
        } else if collectionView == self.typeDishesCollectionView {
            print("Type dishes tapped")
        }
    }
}

extension MenuView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.mainCollectionView {
            return 3
        } else if collectionView == self.typeDishesCollectionView {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mainCollectionView {
            switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return presenter.getDishes().count
            default:
                return 0
            }
        } else if collectionView == self.typeDishesCollectionView {
            return presenter.getTypeDishes().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainCollectionView  {
            switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrototypeDishCell.identifier, for: indexPath) as! PrototypeDishCell
                
                cell.addSubview(typeDishesCollectionView)
                typeDishesCollectionView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
                typeDishesCollectionView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 0).isActive = true
                typeDishesCollectionView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
                typeDishesCollectionView.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: 0).isActive = true
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCell.identifier, for: indexPath) as! OrderCell
                cell.setup(count: presenter.getCountDishes())
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCell.identifier, for: indexPath) as! DishCell
                let item = presenter.getDishes()[indexPath.item]
                cell.setup(dish: item)
                
                return cell
            default:
                fatalError("Unexpected element kind")
            }
        } else if collectionView == self.typeDishesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeDishCell.identifier, for: indexPath) as! TypeDishCell
            let item = presenter.getTypeDishes()[indexPath.item]
            cell.setup(typeDish: item)
            return cell
        }
        return UICollectionViewCell()
    }
}
