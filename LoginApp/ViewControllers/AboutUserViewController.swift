//
//  AboutUserViewController.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 04.05.2023.
//

import UIKit

class AboutUserViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var mainButton: UIButton!
    
    // MARK: - Public properties
    var user: User!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullname
        mainButton.layer.cornerRadius = 10
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.user = user
    }
}
