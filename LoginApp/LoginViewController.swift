//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 21.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    private let user = "Lidiia"
    private let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let catImage = #imageLiteral(resourceName: "login").cgImage
        view.layer.contents = catImage
    }
    
    // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = "Hello, \(user)!"
        }
    
    // MARK: - IBActions
    @IBAction func logInButtonPressed() {
        if userNameTextField.text != user || userPasswordTextField.text != password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter your correct login and password",
                      textField: userPasswordTextField)
            return
        }
        performSegue(withIdentifier: "ShowWelcomeWC", sender: nil)
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Ooops",
                  message: "Your name is \(user)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Ooops",
                  message: "Your password is \(password)")
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


