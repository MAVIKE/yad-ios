import UIKit

class OrderView: UIViewController {
    public var presenter: OrderOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupLayout()
        setupNavigation()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.7333333333, blue: 0, alpha: 1)
        navigationController?.navigationBar.topItem?.title = "Yet Another Delivery"
    }
}

extension OrderView: OrderInputProtocol {
    
}
