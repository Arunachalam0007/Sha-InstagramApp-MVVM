//
//  ProfileCell.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 21/05/21.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let postImageView:UIImageView = {
        let postImgView = UIImageView()
        postImgView.image = #imageLiteral(resourceName: "venom-7")
        postImgView.contentMode = .scaleAspectFill
        postImgView.clipsToBounds = true
        return postImgView
    }()

    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        
        backgroundColor = .orange

        // add Post image to view
        addSubview(postImageView)
        postImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        postImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        postImageView.translatesAutoresizingMaskIntoConstraints = false

    }

}
