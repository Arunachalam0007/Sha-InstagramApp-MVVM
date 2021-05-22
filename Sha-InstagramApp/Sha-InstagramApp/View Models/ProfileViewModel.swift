//
//  ProfileViewModel.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 22/05/21.
//

import Foundation
import Firebase

protocol ProfileInfoDelegate {
    func profileData()
}

class ProfileViewModel {
    
    var profileId: String {
        get {
            return Auth.auth().currentUser?.uid ?? ""
        }
    }
    var profileInfoDelegate: ProfileInfoDelegate?
    var profileInfo: ProfileModel?
    
    var profileImageData: Data? {
        get{
            guard let profileImageURLString = profileInfo?.profileImageURL, let profileImageURL = URL(string: profileImageURLString) else { return nil }
            
           return try? Data(contentsOf: profileImageURL)
        }
    }
    
    func loadProfile() {
        UserProfileInfoService().fetchUserProfileInfo(userId: profileId) { profileData in
            
            if let profileData = profileData, let profileEmail = profileData["email"] as? String, let profileFullname = profileData["fullname"] as? String, let  profileUsername = profileData["username"] as? String,  let profileUserID = profileData["userID"] as? String, let profileImageURL = profileData["profileImageURL"] as? String {
                
                self.profileInfo = ProfileModel(email: profileEmail, fullname: profileFullname, username: profileUsername, userID: profileUserID, profileImageURL: profileImageURL)
                self.profileInfoDelegate?.profileData()
            }
            
        }
    }
}
