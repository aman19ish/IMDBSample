//
//  BaseViewController.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        debugPrint("\(String(describing: self)) dealloacated")
    }
        
}

// MARK: - Show Error Message
extension BaseViewController {
    func showAlertWithHandlers(messageTitle: String = "Unkown", messageText: String?, actionLeftTitle: String = "Cancel", actionRightTitle: String = "ok", cancelCompletion: ((_ alert: UIAlertAction) -> Void)?, okCompletion: ((_ alert: UIAlertAction) -> Void)?) {
        
        let uiAlert = UIAlertController(title: messageTitle, message: messageText ?? "Unkown", preferredStyle: UIAlertController.Style.alert)
        uiAlert.addAction(UIAlertAction(title: actionLeftTitle, style: .default) { (alert) in
            cancelCompletion?(alert)
        })
        uiAlert.addAction(UIAlertAction(title: actionRightTitle, style: .default) { (alert) in
            okCompletion?(alert)
        })
        present(uiAlert, animated: true, completion: nil)
    }
    
}
