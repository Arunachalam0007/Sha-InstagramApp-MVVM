//
//  ProfileListViewModel.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 24/05/21.
//

import Foundation

protocol ProfileListDelegate {
    func profileListData()
}

class ProfileListViewModel {
    
    var listOfProfileVm = [ProfileViewModel]()
    var profileListDelegate: ProfileListDelegate?
    
    var profileVMCount: Int {
        return listOfProfileVm.count
    }
    
    func profileViewModelAtIndex(index: Int) -> ProfileViewModel {
        return listOfProfileVm[index]
    }
    
    func loadAllUserProfile() {
        UserProfileInfoService.fetchAllUserProfileInfo { allUsersData in
            guard let allUsersData = allUsersData else {
                return
            }
            allUsersData.map { profileData in
                if let profileEmail = profileData["email"] as? String, let profileFullname = profileData["fullname"] as? String, let  profileUsername = profileData["username"] as? String,  let profileUserID = profileData["userID"] as? String, let profileImageURL = profileData["profileImageURL"] as? String {
                    
                   let profileModel = ProfileModel(email: profileEmail, fullname: profileFullname, username: profileUsername, userID: profileUserID, profileImageURL: profileImageURL)
                    let profileViewModel = ProfileViewModel()
                    profileViewModel.profileInfo = profileModel
                    self.listOfProfileVm.append(profileViewModel)
                    self.profileListDelegate?.profileListData()
                }
            }
        }
    }
}
