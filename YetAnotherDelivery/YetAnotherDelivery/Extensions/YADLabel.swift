import UIKit

open class YADLabel: UILabel {
    required public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.configureView()
    }
    
    private func configureView() {
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCharacterSpacing(kernValue: Double = 3) {
        if let labelText = text, labelText.isEmpty == false {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern,
                                          value: kernValue,
                                          range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

            guard let labelText = self.text else { return }

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.lineHeightMultiple = lineHeightMultiple

            let attributedString:NSMutableAttributedString
            if let labelattributedText = self.attributedText {
                attributedString = NSMutableAttributedString(attributedString: labelattributedText)
            } else {
                attributedString = NSMutableAttributedString(string: labelText)
            }

            // (Swift 4.2 and above) Line spacing attribute
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))


            // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

            self.attributedText = attributedString
        }
}
