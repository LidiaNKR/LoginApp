//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 21.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = DataManager.shared.user
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.contents = #imageLiteral(resourceName: "login").cgImage
    }
    
    // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let tabBarController = segue.destination as! UITabBarController
            guard let viewControllers = tabBarController.viewControllers else { return }
            for viewController in viewControllers {
                if let welcomeViewController = viewController as? WelcomeViewController {
                    welcomeViewController.user = user
                } else if let navigationViewController = viewController as? UINavigationController {
                    let aboutUserViewController = navigationViewController.topViewController as! AboutUserViewController
                    aboutUserViewController.user = user
                }
            }
        }
    
    // MARK: - IBActions
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user.login || userPasswordTextField.text != user.password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter your correct login and password",
                      textField: userPasswordTextField)
            return
        }
        performSegue(withIdentifier: "ShowWelcomeWC", sender: nil)
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Ooops",
                  message: "Your name is \(user.login)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Ooops",
                  message: "Your password is \(user.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        userPasswordTextField.text = nil
    }
    
}

    // MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

    // MARK: - Keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userPasswordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
        
    }
}


//        userPasswordTextField.rightViewMode = .always
//        let image = UIImage(systemName: "eye")
//        let eyeTextFieldImageView = UIImageView(frame: CGRect(x: -20.0, y: 12.0, width: 20.0, height: 20.0))
//        eyeTextFieldImageView.image = image
//            userPasswordTextField.rightView = eyeTextFieldImageView
//            userPasswordTextField.tintColor = .gray


