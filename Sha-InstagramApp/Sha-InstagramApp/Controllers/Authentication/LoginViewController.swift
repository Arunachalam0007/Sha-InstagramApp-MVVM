//
//  LoginViewController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 19/05/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var loginVM = LoginViewModel()
    
    var instaLogoImage: UIImageView = {
        var instaImage = UIImageView()
        instaImage.image = UIImage(named: "Instagram_logo_white")
        instaImage.contentMode = .scaleAspectFill
        return instaImage
    }()
    
    var emailTextField: UITextField = {
        var emailTextF = CustomTextField(placeHolderName: "Email")
        emailTextF.keyboardType = .emailAddress // set Keyboard keys
        emailTextF.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        return emailTextF
    }()
    
    var passwordTextField: UITextField = {
        var passwordTextF = CustomTextField(placeHolderName: "Password")
        passwordTextF.isSecureTextEntry = true // password Hide
        passwordTextF.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        return passwordTextF
    }()
    
    var loginBtn: UIButton = {
        var lgnBtn = UIButton(type: .system)
        lgnBtn.setTitle("Log In", for: .normal)
        lgnBtn.setTitleColor(.white, for: .normal)
        lgnBtn.isEnabled = false
        lgnBtn.backgroundColor = .systemPurple.withAlphaComponent(0.2)
        lgnBtn.setHeight(50)
        lgnBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return lgnBtn
    }()
    
    var dontHaveAccountBtn: UIButton = {
        var dontHaveAccBtn = UIButton(type: .system)
        dontHaveAccBtn.setCustomAtrributedTitle(firstPart: "Dont' have an account?  ", seccondPart: "Sign Up")
        dontHaveAccBtn.addTarget(self, action: #selector(handleShowSignUp) , for: .touchUpInside)
        return dontHaveAccBtn
    }()
    
    var forgotPasswordBtn: UIButton = {
        var forgotPassBtn = UIButton(type: .system)
        
        forgotPassBtn.setCustomAtrributedTitle(firstPart: "Forgot your password?  ", seccondPart: "Get help signing in")
        
        return forgotPassBtn
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
        configurePropertyUI()
    }
    
    // MARK: - Actions
    
    @objc func textFieldDidChanged(sender: UITextField){
        if sender == emailTextField {
            loginVM.email = sender.text
        } else if sender == passwordTextField {
            loginVM.password = sender.text
        }
        loginBtn.isEnabled = loginVM.isValid
        loginBtn.backgroundColor = loginVM.btnBackgroundColor
    }
    
    @objc func handleShowSignUp() {
        let registrationVC = RegistrationViewController()
        navigationController?.pushViewController(registrationVC, animated: true)
    }
    
    // MARK: - Helpers

    func configurationUI(){
        navigationController?.navigationBar.isHidden = true
        // This will Make barStyle to while color instead of black
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()

    }
    
    
    func configurePropertyUI() {
        
        // Add InstagramLogo
        view.addSubview(instaLogoImage)
        
        instaLogoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        instaLogoImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        instaLogoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        instaLogoImage.centerX(inView: view)
        
        instaLogoImage.translatesAutoresizingMaskIntoConstraints = false
        
        //Add EmailTextField, PassWordTextField,LoginBtn,ForgotpassowrdBtn to View
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       passwordTextField,
                                                       loginBtn,
                                                       forgotPasswordBtn])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: instaLogoImage.bottomAnchor, constant: 32).isActive = true
        
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Add DontHaveAccountBtn to View
        view.addSubview(dontHaveAccountBtn)
        
        dontHaveAccountBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        dontHaveAccountBtn.centerX(inView: view)
        
        dontHaveAccountBtn.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
