import UIKit

extension UIViewController {
    
    func validateDropDownEntries(inputTextFields: UITextFieldWithErrorLabel...) -> Bool {
        
        var faulted = false
        for inputTextField in inputTextFields {
            inputTextField.resignFirstResponder()
            if (inputTextField.text?.isEmpty)! {
                inputTextField.toggleErrorLabelVisibility(isVisible: true)
                faulted = true
            }
        }
        return !faulted
    }
    
    func toggleVisibility(views: UIView..., shouldShow: Bool) {
        views.forEach { (view) in
            view.alpha = shouldShow ? 1.0 : 0.0
        }
    }
    
    func setDelegateOfTextfields(views: UITextField...) {
        views.forEach {
            $0.delegate = self as? UITextFieldDelegate
        }
    }
}
