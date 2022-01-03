//
//  EditNameNCViewController.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

class EditNameNCViewController: UIViewController {

    @IBOutlet weak var editNameTextField: UITextField!
        
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        guard let name = editNameTextField.text, editNameTextField.text != "" else {
            displayAlert(title: "Ooops!", message: "Something is missing!", buttonTitle: "OK")
            return
        }
        configureEditNameNotification(name: name)
        dismiss(animated: true)
    }
}

extension EditNameNCViewController {
    func configureEditNameNotification(name: String) {
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "editName"),
            object: nil,
            userInfo: ["name": name]
        )
    }
}
