//
//  UIViewController+Ext.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

extension UIViewController {
    func displayAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.modalPresentationStyle = .overFullScreen
            alertController.modalTransitionStyle = .crossDissolve
            alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
