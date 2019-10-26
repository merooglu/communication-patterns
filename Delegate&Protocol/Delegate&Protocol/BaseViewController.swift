//
//  BaseViewController.swift
//  Delegate&Protocol
//
//  Created by Mehmet Eroğlu on 26.10.2019.
//  Copyright © 2019 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
    }

    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        // MARK: 1
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
    
}

// MARK: - 2
extension BaseViewController: selectionSideDelegate {
    // MARK: 3
    func sideSelected(image: UIImage, name: String, color: UIColor) {
        imageView.image = image
        nameLabel.text = name
        view.backgroundColor = color
    }

}
