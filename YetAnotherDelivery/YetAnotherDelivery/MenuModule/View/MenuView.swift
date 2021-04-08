import UIKit

class MenuView: UIViewController {
    lazy var TypeDishCellSize = CGSize(width: self.view.frame.width, height: 80)
    lazy var DishCellSize = CGSize(width: self.view.frame.width - 36, height: 120)
    
    var presenter: MenuOutputProtocol!
    
    let mainCollectionView: UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        
        // CollectionView
        let cw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cw.backgroundColor = .white
        cw.translatesAutoresizingMaskIntoConstraints = false
        return cw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
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
        
        mainCollectionView.register(TypeDishCell.self, forCellWithReuseIdentifier: TypeDishCell.identifier)
        mainCollectionView.register(DishCell.self, forCellWithReuseIdentifier: DishCell.identifier)
        mainCollectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        self.view.addSubview(mainCollectionView)
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        mainCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
}

extension MenuView: MenuInputProtocol {
    
}

extension MenuView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.mainCollectionView {
            switch indexPath.section {
            case 0:
                return TypeDishCellSize
            case 1:
                return DishCellSize
            default:
                return CGSize(width: 100, height: 100)
            }
        }
        return CGSize(width: 0, height: 0)
    }
}

extension MenuView: UICollectionViewDelegate {
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
            presenter.didDishTapped()
        }
    }
}

extension MenuView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.mainCollectionView {
        return 2
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mainCollectionView {
            switch section {
            case 0:
                return 1
            case 1:
                return 10
            default:
                return 10
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainCollectionView  {
            switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeDishCell.identifier, for: indexPath) as! TypeDishCell
                cell.backgroundColor = .green
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCell.identifier, for: indexPath) as! DishCell
                cell.setup()
                return cell
            default:
                fatalError("Unexpected element kind")
            }
        }
        return UICollectionViewCell()
    }
}
