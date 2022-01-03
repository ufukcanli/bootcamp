//
//  EditNameCPViewController.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

class EditNameCPViewController: UIViewController {
    
    @IBOutlet weak var editNameTextField: UITextField!
    
    var completion: ((_ name: String) -> Void)?
        
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        guard let name = editNameTextField.text, let completion = completion, editNameTextField.text != "" else {
            displayAlert(title: "Ooops!", message: "Something is missing!", buttonTitle: "OK")
            return
        }
        completion(name)
        dismiss(animated: true)
    }
}
