//
//  AuthenticationViewModel.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 20/05/21.
//

import UIKit

protocol FormViewModel {
    func updateFormBtn()
}

protocol AutheticationViewModel {
    var btnIsValid:Bool { get }
    var btnBackgroundColor:UIColor { get }
}

struct LoginViewModel: AutheticationViewModel {
    var email:String?
    var password:String?
    var btnIsValid:Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    var btnBackgroundColor:UIColor {
        return btnIsValid ? .systemPurple.withAlphaComponent(1) : .systemPurple.withAlphaComponent(0.2)
    }
}

struct RegistrationViewModel: AutheticationViewModel {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    var profileImage: UIImage?
    
    var btnIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var btnBackgroundColor: UIColor {
        return btnIsValid ? .systemPurple.withAlphaComponent(1) : .systemPurple.withAlphaComponent(0.2)
    }
    
    func registerUserDetails() {
        guard let email = email,let password = password,let fullname = fullname,let username = username,let profileImageData = profileImage?.jpegData(compressionQuality: 0.7) else {
            print("DEBUG: please fill all your information")
            return
        }
        
        let authCredentials = AuthenticationCredentials(email: email, password: password, username: username, fullname: fullname, imageData: profileImageData)
        AuthService().registerUser(authCredentials: authCredentials) { response in
            print("DEBUG: \(response ?? "Unable to Register please Check all your information")")
        }
    }
}
