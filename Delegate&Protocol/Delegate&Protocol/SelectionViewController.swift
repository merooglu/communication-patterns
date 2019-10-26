//
//  SelectionViewController.swift
//  Delegate&Protocol
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit
// MARK: 1
protocol selectionSideDelegate {
    func sideSelected(image: UIImage, name: String, color: UIColor)
}

class SelectionViewController: UIViewController {
    // MARK: - 2
    var selectionDelegate: selectionSideDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func imperialButtonTapped(_ sender: Any) {
        // MARK: 3
        selectionDelegate.sideSelected(image: UIImage(named: "vader")!, name: "Dart Vader", color: UIColor.red)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rebelButtonTapped(_ sender: Any) {
        // MARK: 3
        selectionDelegate.sideSelected(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: UIColor.cyan)
        dismiss(animated: true, completion: nil)
    }
    
}
