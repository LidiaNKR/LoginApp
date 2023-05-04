//
//  DetailViewController.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 04.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userPhotoImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Public properties
    var user: User!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userPhotoImageView.image = user.person.information.photo
        descriptionLabel.text = user.person.information.description
    }
    
    override func viewWillLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
}
