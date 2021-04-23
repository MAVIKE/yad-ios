import UIKit

open class YADNavigationController: UINavigationController, UINavigationControllerDelegate {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = self
        configureView()
    }
    
//    @objc
//    public func init() {
//        super.init()
//    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        delegate = self
        configureView()
    }
    
    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        delegate = self
        configureView()
    }
    
    private func configureView() {
        navigationBar.barTintColor = #colorLiteral(red: 0.9843137255, green: 0.7333333333, blue: 0, alpha: 1)
        navigationBar.prefersLargeTitles = true
        navigationBar.topItem?.title = "Yet Another Delivery"
    }
}
