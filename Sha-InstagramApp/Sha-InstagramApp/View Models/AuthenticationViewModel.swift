//
//  AuthenticationViewModel.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 20/05/21.
//

import UIKit

struct LoginViewModel {
    var email:String?
    var password:String?
    var isValid:Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    var btnBackgroundColor:UIColor {
        return isValid ? .systemPurple.withAlphaComponent(1) : .systemPurple.withAlphaComponent(0.2)
    }
}

struct RegistrationViewModel {
    
}
