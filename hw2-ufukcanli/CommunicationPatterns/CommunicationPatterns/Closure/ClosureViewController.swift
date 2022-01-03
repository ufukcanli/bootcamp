//
//  ClosureViewController.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

class ClosureViewController: UIViewController {

    @IBOutlet weak var greetingMessageLabel: UILabel!
    @IBOutlet weak var warningMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Closure"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNameSegueCP" {
            if let destination = segue.destination as? EditNameCPViewController {
                destination.completion = { [weak self] name in
                    self?.updateUI(with: name)
                }
            }
        }
    }
}

extension ClosureViewController {
    func updateUI(with name: String) {
        greetingMessageLabel.text = "Hello, \(name)!"
        warningMessageLabel.text = "It is nice to meet you!"
    }
}
