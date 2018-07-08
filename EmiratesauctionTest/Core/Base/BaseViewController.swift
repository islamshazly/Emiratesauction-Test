//
//  BaseViewController.swift


import UIKit
import PKHUD



protocol BaseLoadingProtocol  {
    
    func showLoadingIndicator()
    func showSuccessIndicator()
    func showSuccessFlash(withDuration duration: Double , action :@escaping()->(Void))
    func showSuccessIndicator(_ action :@escaping()->())
    func showErrorIndicator()
    func hideLoadingIndicator()
    func showLoadingInView(_ view : UIView)
    
    
}


class BaseViewController: UIViewController , ServiceDelegate {
    
    //MARK: variables
    
    //MARK: outlets
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        
    }
    
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismiss(_ sender :Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func retry() {
        
        if NetworkManager.serverReachable(forUrl: baseURL) {
            self.showLoadingIndicator()
            NetworkManager.restartRequest()
        }
        
    }
    
    
    
    //MARK: service Delegate
    
    func didReceiveDataSuccessfully(data: Any, identifier: String) {
        hideLoadingIndicator()
    }
    
    func didFailToReceiveData(error: TError, identifer: String) {
        hideLoadingIndicator()
        
        
        UIAlertController.ShowAlert(VC: self, message: error.localizedDescription, action: nil)
        
    }
    
}

extension BaseViewController : BaseLoadingProtocol {
    func showLoadingInView(_ view: UIView) {
        HUD.show(.progress, onView: view)
        
    }
    
    
    func showSuccessFlash(withDuration duration: Double, action:@escaping () -> (Void)) {
        
        HUD.flash(.success, onView: self.view, delay: duration) { (_) in
            action()
        }
        
    }
    
    func showLoadingIndicator() {
        
        HUD.show(.progress, onView: self.view)
    }
    
    func showSuccessIndicator() {
        HUD.dimsBackground = true
        HUD.show(.success, onView: self.view)
    }
    
    func showErrorIndicator() {
        HUD.show(.error, onView: self.view)
    }
    
    func hideLoadingIndicator() {
        
        
        HUD.hide(animated: true)
    }
    func showSuccessIndicator(_ action :@escaping ()->()) {
        
        
        HUD.flash(.success, onView: self.view, delay: 1.5) { (_) in
            
            action()
        }
        
    }
    
}

