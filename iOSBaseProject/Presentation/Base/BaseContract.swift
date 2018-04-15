import Foundation

protocol BaseView: NSObjectProtocol {
    
    func showLoading()
    
    func showLoading(withMessage text: String)
    
    func dismissLoading()
    
    func showError(message text: String)
    
    func showToast(withMessage message: String)
    
    func showToast(withMessage message: String, showTimeInSeconds: Float)

    func showError(title: String, message text: String)
    
    func isNetworkConnected()
}

protocol BasePresenter {
    
    func detachView()
}
