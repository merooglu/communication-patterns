//
//  BaseViewController.swift
//  Delegate&Protocol
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

// Step: 1
let darkNotificationKey = "darkSide"
let lightNotificationKey = "lightSide"

class BaseViewController: UIViewController {

    @IBOutlet weak var chracterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    // Step: 3
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark = Notification.Name(rawValue: darkNotificationKey)
    
    // Step: 4
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
        // Step: 8
        createObservers()
    }
    
    // Step: 5
    func createObservers() {
        // Step: 6
        // light observers
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateChracterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateChracterName(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackgroundColor(notification:)), name: light, object: nil)
        // dark observers
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateChracterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateChracterName(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackgroundColor(notification:)), name: dark, object: nil)
    }
    
    // Step: 7
    @objc func updateChracterImage(notification: NSNotification) {
        // Step: 9
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "luke")! : UIImage(named: "vader")!
        chracterImageView.image = image
    }
    
    // Step: 7
    @objc func updateChracterName(notification: NSNotification) {
        // Step: 9
        let isDark = notification.name == dark
        let name = isDark ? "Dart Vader" : "Luke Skywalker"
        nameLabel.text = name
    }
    
    // Step: 7
    @objc func updateBackgroundColor(notification: NSNotification) {
        // Step: 9
        let isLight = notification.name == light
        let bgColor = isLight ? UIColor.cyan : UIColor.red
        view.backgroundColor = bgColor
    }
    
    
    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        present(selectionVC, animated: true, completion: nil)
    }
    
}
