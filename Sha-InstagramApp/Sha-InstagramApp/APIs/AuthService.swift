//
//  AuthService.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 20/05/21.
//

import Firebase

struct AuthenticationCredentials{
    var email:String
    var password:String
    var username:String
    var fullname:String
    var imageData:Data
}

struct AuthService {
    
    func registerUser(authCredentials: AuthenticationCredentials, completion: @escaping (String?)-> () ){
        
        ImageUploader().uploadProfileImageToFireStorage(data: authCredentials.imageData) { imageURL in
            guard let imageURL = imageURL else {
                print("DEBUG: Unable To GET ImageURL from FireStore")
                completion(nil)
                return
            }
            // Creating Auth User
            Auth.auth().createUser(withEmail: authCredentials.email, password: authCredentials.password) { authResult, error in
                if let error = error {
                    print("DEBUG: Unable to Set Authentication: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                                
                // Get Authenticated UserID
                guard let userId = authResult?.user.uid else {
                    print("DEBUG: Authenticated UserId is Empty")
                    completion(nil)
                    return
                }
                
                let userData: [String:Any] = ["email":authCredentials.email,
                                              "fullname":authCredentials.fullname,
                                              "username": authCredentials.username,
                                              "profileImageURL":imageURL,
                                              "userID":userId]
                
                // Store UserDat in Firebase database
                Firestore.firestore().collection("users").addDocument(data: userData) { error in
                    if let error = error {
                        print("DEBUG: Unable to Add User Data in Users Database: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                    completion("Success Registered User Ready to Login")
                }
                
            }
        }
    }
}
