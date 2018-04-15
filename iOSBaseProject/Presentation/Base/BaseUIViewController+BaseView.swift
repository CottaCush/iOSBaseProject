import UIKit
import MBProgressHUD
import Toast_Swift

// Mark - Generic View Setup 
extension BaseViewController: BaseView {
    
    func showToast(withMessage message: String, showTimeInSeconds: Float) {
        self.view.makeToast(message, duration: TimeInterval(showTimeInSeconds), completion: nil)
    }
    
    func showToast(withMessage message: String) {
        self.view.makeToast(message, duration: 1.5, completion: nil)
    }
    
    func showLoading() {
        showProgressIndicator(withMessage: StringLiterals.PLEASE_WAIT)
    }
    
    func showLoading(withMessage text: String) {
        showProgressIndicator(withMessage: text)
    }
    
    func dismissLoading() {
        dismissProgressIndicator()
    }
    
    func showError(title: String, message text: String) {
        createErrorDialog(title: title, message: text)
    }
    
    func showError(message text: String) {
        createErrorDialog(message: text)
    }
    
    func isNetworkConnected() {}
}


// Mark - Common View Actions

extension UIViewController {
    
    func performSegue(identifier: String) {
        OperationQueue.main.addOperation {
            [weak self] in
            self?.performSegue(withIdentifier: identifier, sender: self);
        }
    }
    
    func instantiateViewController(withIdentifier id : String, from storyBoardName: String) -> UIViewController {
        // Get the Storyboard with id and Create View COntroller with parameter name -> storyBoardName
        let storyboard = UIStoryboard (name: storyBoardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id)

        return vc
    }
    
    func createErrorDialog(title: String! = "Oops!", message: String! = StringLiterals.GENERIC_NETWORK_ERROR) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil);
        alertController.addAction(defaultAction);
        
        
        self.present(alertController, animated: true, completion: nil);
    }
}

// MARK - Progress Loading Indicator

extension BaseViewController {
    
    func showProgressIndicator(withMessage message: String) {
        self.view.endEditing(true)
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = message
        hud.mode = MBProgressHUDMode.indeterminate
        hud.isUserInteractionEnabled = false
        showNetworkIndicator(status: true)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func dismissProgressIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
        showNetworkIndicator(status: false)
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func showNetworkIndicator(status: Bool = true) {
        OperationQueue.main.addOperation {
            [weak self] in
            _ = self.debugDescription
            UIApplication.shared.isNetworkActivityIndicatorVisible = status;
        }
    }
}
