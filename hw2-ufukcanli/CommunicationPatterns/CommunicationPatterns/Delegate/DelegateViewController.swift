//
//  DelegateViewController.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

class DelegateViewController: UIViewController {
    
    @IBOutlet weak var greetingMessageLabel: UILabel!
    @IBOutlet weak var warningMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Delegate"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNameSegueDP" {
            if let destination = segue.destination as? EditNameDPViewController {
                destination.delegate = self
            }
        }
    }
}

extension DelegateViewController: EditNameDPViewControllerDelegate {
    func didFinishEditing(name: String) {
        greetingMessageLabel.text = "Hello, \(name)!"
        warningMessageLabel.text = "It is nice to meet you!"
    }
}
