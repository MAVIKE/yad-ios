import UIKit

class HomeView: UIViewController {
    lazy var MenuSelectionCellSize = CGSize(width: view.frame.width - 42, height: 190)
    
    var presenter: HomeOutputProtocol!
    
    let collectionView: UICollectionView = {
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
        navigationController?.navigationBar.topItem?.title = "Yet Another Delivery"
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MenuSelectionCell.self, forCellWithReuseIdentifier: MenuSelectionCell.identifier)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        self.view.addSubview(collectionView)
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
}

extension HomeView: HomeInputProtocol {
    
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return MenuSelectionCellSize
        default:
            return CGSize(width: 100, height: 100)
        }
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(HeaderCell.height))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            
            reusableview.frame = CGRect(x: 0 , y: 0, width: Int(view.frame.width), height: HeaderCell.height)
            reusableview.setupView(title: "Популярные рестораны")
            return reusableview
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didRestaurantTapped()
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuSelectionCell.identifier, for: indexPath) as! MenuSelectionCell
            cell.setup(imageUrl: "kek", title: "Крошка картошка")
            return cell
        default:
            fatalError("Unexpected element kind")
        }
    }
}


