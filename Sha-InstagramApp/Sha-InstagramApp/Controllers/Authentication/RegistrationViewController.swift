//
//  RegistrationViewController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 19/05/21.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - Properties
    
    let plusPhotoBtn: UIButton = {
        let photoBtn = UIButton(type: .system)
        photoBtn.setImage(UIImage(named: "plus_photo"), for: .normal)
        photoBtn.tintColor = .white
        photoBtn.setHeight(140)
        photoBtn.setWidth(140)
        return photoBtn
    }()
    
    let emailTextF: UITextField = {
        let emailTF = CustomTextField(placeHolderName: "Email")
        emailTF.keyboardType = .emailAddress
        return emailTF
    }()
    
    let passwordTextF: UITextField = {
        let passwordTF = CustomTextField(placeHolderName: "Password")
        passwordTF.isSecureTextEntry = true
        return passwordTF
    }()
    
    let fullNameTextF: UITextField = {
        let fNameTF = CustomTextField(placeHolderName: "Fullname")
        return fNameTF
    }()
    
    let userNameTextF: UITextField = {
        let uNameTF = CustomTextField(placeHolderName: "Username")
        return uNameTF
    }()
    
    let signUpBtn: UIButton = {
        let signBtn = UIButton(type: .system)
        signBtn.setTitle("Sign Up", for: .normal)
        signBtn.setTitleColor(.white, for: .normal)
        signBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signBtn.backgroundColor = .systemPurple
        signBtn.layer.cornerRadius = 5
        signBtn.setHeight(50)
        return signBtn
    }()
    
    let alreadyHaveAnAccount: UIButton = {
        let haveAccountBtn = UIButton(type: .system)
        haveAccountBtn.setCustomAtrributedTitle(firstPart: "Don't have an account?  ", seccondPart: "Sign In")
        haveAccountBtn.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return haveAccountBtn
    }()
    
    // MARK: - Actions

   @objc func handleShowSignIn() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
    // MARK: - Helpers

    func configureUI() {
        
        configureGradientLayer()
        
        // Add plus photo btn
        
        view.addSubview(plusPhotoBtn)
        plusPhotoBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 32).isActive = true
        plusPhotoBtn.centerX(inView: view)
        plusPhotoBtn.translatesAutoresizingMaskIntoConstraints = false
        
        // add stackviw of textFields
        
        let stackView = UIStackView(arrangedSubviews: [emailTextF,
                                                       passwordTextF,
                                                       fullNameTextF,
                                                       userNameTextF,
                                                       signUpBtn])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: plusPhotoBtn.bottomAnchor , constant: 32).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // add alreadyHaveAnAccount btn
        view.addSubview(alreadyHaveAnAccount)
        
        alreadyHaveAnAccount.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        alreadyHaveAnAccount.centerX(inView: view)
        alreadyHaveAnAccount.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
