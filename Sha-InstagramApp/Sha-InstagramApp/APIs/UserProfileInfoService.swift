//
//  UserProfileInfoService.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 22/05/21.
//

import Foundation
import Firebase

class UserProfileInfoService{

    func fetchUserProfileInfo(userId:String, completion: @escaping ([String:Any]?)->Void){
        Firestore.firestore().collection("users").document(userId).getDocument { documentSnapshot, error in

            guard let profileInfo = documentSnapshot?.data() else{
              completion(nil)
              return
            }
            completion(profileInfo)
        }
    }
}
