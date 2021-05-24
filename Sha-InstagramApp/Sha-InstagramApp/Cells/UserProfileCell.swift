//
//  UserProfileCell.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 24/05/21.
//

import Foundation
import UIKit

class UserProfileCell: UITableViewCell {
    // MARK: - Propertes
    
    private let profileImageView: UIImageView = {
       let profileIV = UIImageView()
        profileIV.contentMode = .scaleAspectFill
        profileIV.image = #imageLiteral(resourceName: "venom-7")
        profileIV.clipsToBounds = true
        profileIV.backgroundColor = .lightGray
        return profileIV
    }()
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Venom"
        return label
    }()
    
    private let fullNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Venom"
        label.textColor = .lightGray
        return label
    }()
    
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers

    func configureUICell(){
        
        // Add ProfileImage
        addSubview(profileImageView)
        profileImageView.setDimensions(height: 48, width: 48)
        profileImageView.layer.cornerRadius = 48/2
        profileImageView.centerY(inView: self)
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add stack with userName and fullName
        let stack = UIStackView(arrangedSubviews: [userNameLabel,fullNameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        
        addSubview(stack)
        stack.centerY(inView: self)
        stack.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
    }

}
