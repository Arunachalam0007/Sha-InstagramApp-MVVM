//
//  ProfileHeaderReusable.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 21/05/21.
//

import UIKit

class ProfileHeaderReusable: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
