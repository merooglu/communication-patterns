//
//  SelectionViewController.swift
//  Delegate&Protocol
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func imperialButtonTapped(_ sender: Any) {
        // Step: 2
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rebelButtonTapped(_ sender: Any) {
        // Step: 2
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
}
