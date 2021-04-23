import UIKit

open class YADView: UIView {
    required public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.configureView()
    }
    
    private func configureView() {
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
