import UIKit

extension UINavigationController {
    public func configureView() {
        self.view.backgroundColor = .green
        self.navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.7333333333, blue: 0, alpha: 1)
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.topItem?.title = "Yet Another Delivery"
    }
}
