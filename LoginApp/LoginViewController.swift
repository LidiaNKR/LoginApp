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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.contents = #imageLiteral(resourceName: "login").cgImage
        
        let eyeTextFieldImageView = UIImageView(frame: CGRect(x: 8.0, y: 12.0, width: 20.0, height: 20.0))
        let image = UIImage(systemName: "eye")
        eyeTextFieldImageView.image = image
            userPasswordTextField.rightViewMode = .always
            userPasswordTextField.rightView = eyeTextFieldImageView
            userPasswordTextField.tintColor = .gray

    }
    
    @IBAction func logInButtonPressed() {
        guard let inputUserName = userNameTextField.text, !inputUserName.isEmpty else {
            showAlert(with: "User Name is empty", and: "Please enter your name")
            return
        }
        
        guard let inputUserPassword = userPasswordTextField.text, !inputUserPassword.isEmpty else {
            showAlert(with: "User Password is empty", and: "Please enter your password")
            return
        }
        
        if let _ = Double(inputUserName) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }
        userNameTextField.text = inputUserName
        
        //        if userNameTextField && userPasswordTextField {
        //            showAlert(with: "Wrong format", and: "Please enter your name")
        //            return
        //        }
        //        userNameTextField.text = inputUserName
    }
    
    
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard let user = userNameTextField.text else { return }
        welcomeVC.userName = "Hello, \(user)!"
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}



