//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Ufuk Canlı on 2.01.2022.
//

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet weak var workingLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [UIButton]!
    
    private var manager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func someButtonDidTap(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        manager.makeAction(value, tag: sender.tag)
        updateUI()
        
        if manager.errorHappened {
            displayAlert(title: "Ooops!", message: "Invalid input.", buttonTitle: "OK")
            manager.errorHappened = false
        }
    }
}

private extension CalculatorViewController {
    func updateUI() {
        workingLabel.text = manager.working
        resultLabel.text = manager.result
    }
}
