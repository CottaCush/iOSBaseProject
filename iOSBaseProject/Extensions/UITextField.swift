import Foundation

extension UITextField {
    
    func updateState(enable: Bool) {
        
        self.isEnabled = enable
        self.textColor = (enable) ? UIColor.fiiBlack : UIColor.fiiLightBlue
        self.isUserInteractionEnabled = enable
    }
}
