import UIKit

class OrderView: UIViewController {
    
    public var presenter: OrderOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.backgroundColor = .gray
    }
}

extension OrderView: OrderInputProtocol {
    
}
