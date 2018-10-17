import UIKit

class UITextFieldWithErrorLabel: UITextField {
    
    private var errorLabel: UILabel? = nil
    private var placeHolder: String?
    
    var errorMessage: String = StringLiterals.FIELD_IS_REQUIRED {
        didSet {
            errorLabel?.text = errorMessage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpErrorLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpErrorLabel()
    }
    
    func setUpErrorLabel() {
        errorLabel = UILabel(frame: CGRect(x: 0, y: 8, width: self.frame.width - 16, height: 17))
        errorLabel?.font = UIFont.systemFont(ofSize: 10)
        errorLabel?.textColor = UIColor.red
        errorLabel?.text = StringLiterals.FIELD_IS_REQUIRED
        
        self.addSubview(errorLabel!)
        errorLabel!.isHidden = true
        placeHolder = self.placeholder
    }

    public func toggleErrorLabelVisibility(isVisible :Bool) {
        errorLabel?.isHidden = !isVisible
        self.placeholder = isVisible ? "" : placeHolder
        self.animationLabel()
    }
    
    private func animationLabel() {
        if errorLabel != nil {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.errorLabel!.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { (completed) -> Void in
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    self.errorLabel!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
            }
        }
    }
}
