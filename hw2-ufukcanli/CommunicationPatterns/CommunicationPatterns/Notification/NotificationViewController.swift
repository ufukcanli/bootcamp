//
//  NotificationViewController.swift
//  CommunicationPatterns
//
//  Created by Ufuk Canlı on 20.12.2021.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var greetingMessageLabel: UILabel!
    @IBOutlet weak var warningMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Notification"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNameSegueNC" {
            if let _ = segue.destination as? EditNameNCViewController {
                configureEditNameNotificationObserver()
            }
        }
    }
    
    @objc func didReceiveNotification(_ notification: Notification) {
        guard let name = notification.userInfo?["name"] as? String else { return }
        greetingMessageLabel.text = "Hello, \(name)!"
        warningMessageLabel.text = "It is nice to meet you!"
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension NotificationViewController {
    func configureEditNameNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveNotification(_:)),
            name: Notification.Name("editName"),
            object: nil
        )
    }
}
