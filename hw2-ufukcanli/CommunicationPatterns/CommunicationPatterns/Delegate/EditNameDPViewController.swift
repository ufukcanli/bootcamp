//
//  EditNameDPViewController.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

protocol EditNameDPViewControllerDelegate: AnyObject {
    func didFinishEditing(name: String)
}

class EditNameDPViewController: UIViewController {

    @IBOutlet weak var editNameTextField: UITextField!
    
    weak var delegate: EditNameDPViewControllerDelegate?
    
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        guard let name = editNameTextField.text, editNameTextField.text != "" else {
            displayAlert(title: "Ooops!", message: "Something is missing!", buttonTitle: "OK")
            return
        }
        delegate?.didFinishEditing(name: name)
        dismiss(animated: true)
    }
}
