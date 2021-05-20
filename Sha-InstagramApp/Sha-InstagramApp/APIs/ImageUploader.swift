//
//  ImageUploader.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 20/05/21.
//

import FirebaseStorage

struct ImageUploader{
    
    func uploadProfileImageToFireStorage(data: Data, completion: @escaping (String?) -> ()){
        
        let id = NSUUID().uuidString // generate Unique Id
        // Reference(folder) for Firebase Storage
        let ref = Storage.storage().reference(withPath: "Instagram_Profile_Images/\(id)")
        // put or upload the image data to the ref (folder)
        ref.putData(data, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Unable To Store ProfileData In FireStorage: ",error.localizedDescription)
                completion(nil)
                return
            }
            // get the imageURL from image in the ref(Folder)
            ref.downloadURL { url, error in
                guard let imageURL = url?.absoluteString else {
                    print("DEBUG: Unable get Download Image URL: \(error?.localizedDescription ?? "")")
                    completion(nil)
                    return
                }
                completion(imageURL)
            }
        }
    }
}
