//
//  SignupViewController.swift
//  Messanger
//
//  Created by Noah Schmitt on 05.03.22.
//

import UIKit

class SignupViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Gray") as Any])
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor(named: "LightGray")?.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        textField.textColor = UIColor(named: "Gray")
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Gray") as Any])
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor(named: "LightGray")?.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = UIColor(named: "Gray")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Gray") as Any])
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor(named: "LightGray")?.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = UIColor(named: "Gray")
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Signup", for: .normal)
        button.backgroundColor = UIColor(named: "Blue")
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let emailErrorMessage: UILabel = {
        let label = UILabel()
        label.text = "Please enter an email"
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private let passwordErrorMessage: UILabel = {
        let label = UILabel()
        label.text = "Please enter an password"
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private let nameErrorMessage: UILabel = {
        let label = UILabel()
        label.text = "Please enter an name"
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private let passwordLengthErrorMessage: UILabel = {
        let label = UILabel()
        label.text = "Your password length must be longer than 8 characters"
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupLayout()
    }

    private func setupLayout() {
        
        // background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background-signup")
            backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        
        // add subviews
        view.addSubview(backButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nameTextField)
        view.addSubview(signUpButton)
        view.addSubview(emailErrorMessage)
        view.addSubview(passwordErrorMessage)
        view.addSubview(nameErrorMessage)
        view.addSubview(passwordLengthErrorMessage)
        
        // add constrains
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 520).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        emailErrorMessage.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -70).isActive = true
        emailErrorMessage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        emailErrorMessage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        passwordErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        passwordErrorMessage.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -70).isActive = true
        passwordErrorMessage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        passwordErrorMessage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        passwordLengthErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        passwordLengthErrorMessage.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -70).isActive = true
        passwordLengthErrorMessage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        passwordLengthErrorMessage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        nameErrorMessage.translatesAutoresizingMaskIntoConstraints = false
        nameErrorMessage.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -70).isActive = true
        nameErrorMessage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameErrorMessage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func signUpButtonPressed() {
        let emailString = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordString = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let nameString = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if nameString?.isEmpty == true {
            emailErrorMessage.isHidden = true
            passwordErrorMessage.isHidden = true
            passwordLengthErrorMessage.isHidden = true
            nameErrorMessage.isHidden = false
            return
        }
        
        if emailString?.isEmpty == true {
            emailErrorMessage.isHidden = false
            passwordErrorMessage.isHidden = true
            passwordLengthErrorMessage.isHidden = true
            nameErrorMessage.isHidden = true
            return
        }
        
        if passwordString?.isEmpty == true {
            emailErrorMessage.isHidden = true
            passwordErrorMessage.isHidden = false
            passwordLengthErrorMessage.isHidden = true
            nameErrorMessage.isHidden = true
            return
        }
        
        if passwordString!.count < 8 {
            emailErrorMessage.isHidden = true
            passwordErrorMessage.isHidden = true
            passwordLengthErrorMessage.isHidden = false
            nameErrorMessage.isHidden = true
            return
        }
        
        AuthManager.shared.signUp(email: emailString!, password: passwordString!)
    }
}
