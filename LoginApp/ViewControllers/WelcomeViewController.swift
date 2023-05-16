//
//  ViewController.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 21.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var welcomLabel: UILabel!
    @IBOutlet var userPhotoUIImage: UIImageView!
    
    // MARK: - Public properties
    var user: User!
    
    // MARK: - Private properties
    private let gradient = CAGradientLayer()
    
    // MARK: - Private properties
    
    ///Значение первоначального цвета для градиента
    private let firstColor = UIColor(red: 200/250,
                                     green: 200/250,
                                     blue: 200/250,
                                     alpha: 1)
    
    ///Значение окончательного цвета для градиента
    private let secondColor = UIColor(red: 250/250,
                                     green: 250/250,
                                     blue: 250/250,
                                     alpha: 1)
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVerticalGradientLayer(topColor: firstColor,
                                 buttomColor: secondColor)
        userPhotoUIImage.image = user.person.information.photo
        welcomLabel.text = "Welcome, \(user.person.fullname)!"
    }
    
    override func viewWillLayoutSubviews() {
        userPhotoUIImage.layer.cornerRadius = userPhotoUIImage.frame.width / 2
        gradient.frame = view.bounds
    }
}

    // MARK: - Set background color
extension WelcomeViewController {
    
    ///Настройка градиента
    func addVerticalGradientLayer(topColor: UIColor, buttomColor: UIColor) {
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, buttomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}


