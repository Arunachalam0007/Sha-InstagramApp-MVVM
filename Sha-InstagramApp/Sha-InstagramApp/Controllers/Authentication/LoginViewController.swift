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
    
    var instaLogoImage: UIImageView = {
        var instaImage = UIImageView()
        instaImage.image = UIImage(named: "Instagram_logo_white")
        instaImage.contentMode = .scaleAspectFill
        return instaImage
    }()
    
    var emailTextField: UITextField = {
        var emailTextF = UITextField()
        emailTextF.textColor = .white
        emailTextF.backgroundColor = UIColor(white: 1, alpha: 0.1)
        emailTextF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.6)])
        emailTextF.setHeight(50)
        emailTextF.keyboardType = .emailAddress // set Keyboard keys
        emailTextF.keyboardAppearance = .dark // set keyboard color
        return emailTextF
    }()
    
    var passwordTextField: UITextField = {
        var passwordTextF = UITextField()
        passwordTextF.textColor = .white
        passwordTextF.backgroundColor = UIColor(white: 1, alpha: 0.1)
        passwordTextF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.6)])
        passwordTextF.setHeight(50)
        passwordTextF.isSecureTextEntry = true // password Hide
        passwordTextF.keyboardAppearance = .dark // set keyboard color
        return passwordTextF
    }()
    
    var loginBtn: UIButton = {
        var lgnBtn = UIButton(type: .system)
        lgnBtn.setTitle("Log In", for: .normal)
        lgnBtn.setTitleColor(.white, for: .normal)
        lgnBtn.backgroundColor = .systemPurple
        lgnBtn.setHeight(50)
        lgnBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return lgnBtn
    }()
    
    var dontHaveAccountBtn: UIButton = {
        var dontHaveAccBtn = UIButton(type: .system)
        
        var attri: [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.87) , .font: UIFont.systemFont(ofSize: 16)]
        var boldAttri: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(white: 1, alpha: 0.87) , .font: UIFont.boldSystemFont(ofSize: 16) ]
        
        var btnTitle = NSMutableAttributedString (string: "Dont' have an account?  ", attributes: attri)
        btnTitle.append(NSAttributedString(string: "Sign Up", attributes: boldAttri))
        
        dontHaveAccBtn.setAttributedTitle(btnTitle, for: .normal)
        return dontHaveAccBtn
    }()
    
    var forgotPasswordBtn: UIButton = {
        var forgotPassBtn = UIButton(type: .system)
        
        var attri: [NSAttributedString.Key : Any] = [.foregroundColor : UIColor(white: 1, alpha: 0.7) , .font: UIFont.systemFont(ofSize: 16)]
        var boldAttri: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(white: 1, alpha: 0.7) , .font: UIFont.boldSystemFont(ofSize: 16) ]
        
        //NSMutableAttributedString is used to append another NSAttributedString
        var btnTitle = NSMutableAttributedString (string: "Forgot your password?  ", attributes: attri)
        btnTitle.append(NSAttributedString(string: "Get help signing in", attributes: boldAttri))
        
        // set NsMutableAttributesString to AtrributedTitle
        forgotPassBtn.setAttributedTitle(btnTitle, for: .normal)
        return forgotPassBtn
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
        configurePropertyUI()
    }
    
    // MARK: - Helpers

    func configurationUI(){
        navigationController?.navigationBar.isHidden = true
        // This will Make barStyle to while color instead of black
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .green
        
        let gradient = CAGradientLayer()
        gradient.colors = [ UIColor.systemPurple.cgColor , UIColor.systemBlue.cgColor]
       // gradient.locations = [0,1]

        view.layer.addSublayer(gradient)
        // We must set view frame to gradient frame
        gradient.frame = view.frame

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
