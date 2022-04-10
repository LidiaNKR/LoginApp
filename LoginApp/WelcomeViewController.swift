//
//  ViewController.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 21.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.contents = #imageLiteral(resourceName: "welcome").cgImage
        
        userNameLabel.text = userName
    }
}

