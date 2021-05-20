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
    
    var registrationVM = RegistrationViewModel()
    
    var profileImage: UIImageView = UIImageView()
    
    let plusPhotoBtn: UIButton = {
        let photoBtn = UIButton(type: .system)
        photoBtn.setImage(UIImage(named: "plus_photo"), for: .normal)
        photoBtn.tintColor = .white
        photoBtn.setHeight(140)
        photoBtn.setWidth(140)
        photoBtn.addTarget(self, action: #selector(handleShowProfilePhoto), for: .touchUpInside)
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
        signBtn.isEnabled = false
        signBtn.backgroundColor = .systemPurple.withAlphaComponent(0.2)
        signBtn.layer.cornerRadius = 5
        signBtn.setHeight(50)
        signBtn.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
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
    
    @objc func handleShowSignUp(){
        registrationVM.email = emailTextF.text
        registrationVM.password = passwordTextF.text
        registrationVM.fullname = fullNameTextF.text
        registrationVM.username = userNameTextF.text
        registrationVM.profileImage = profileImage.image
        
        registrationVM.registerUserDetails()
    }
    
    @objc func textFieldDidChanged(sender: UITextField) {
        if sender == emailTextF {
            registrationVM.email = sender.text
        } else if sender == passwordTextF {
            registrationVM.password = sender.text
        } else if sender == userNameTextF {
            registrationVM.username = sender.text
        } else if sender == fullNameTextF {
            registrationVM.fullname = sender.text
        }
        updateFormBtn()
    }
    
    @objc func handleShowProfilePhoto(sender: UIButton) {
       
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        // allow editing must True or else we can't select image
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
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
    
    func configureNotificationObservers(){
        emailTextF.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        passwordTextF.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        fullNameTextF.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        userNameTextF.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
}

// MARK: - FormViewModel

extension RegistrationViewController: FormViewModel {
    func updateFormBtn() {
        signUpBtn.isEnabled = registrationVM.btnIsValid
        signUpBtn.backgroundColor = registrationVM.btnBackgroundColor
    }
}

// MARK: - ImagePickerControllerDelegate

extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // didFinishPickingMediaWithInfo This Call after pick the image from phone
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImageFromPhone = info[.editedImage] as? UIImage else { return }
        
        // We must add .withRenderingMode(.alwaysOriginal) then only image will show into screen
        plusPhotoBtn.setImage(selectedImageFromPhone.withRenderingMode(.alwaysOriginal), for: .normal)
        
        // Set your slected photo to ProfilePhoto
        profileImage.image = plusPhotoBtn.image(for: .normal)
        plusPhotoBtn.layer.cornerRadius = plusPhotoBtn.frame.width/2
        plusPhotoBtn.layer.masksToBounds = true // Must add this line
        plusPhotoBtn.layer.borderWidth = 2
        plusPhotoBtn.layer.borderColor = UIColor.white.cgColor
        
        dismiss(animated: true) {
            print("Dismissed from phone")
        }
    }
}

