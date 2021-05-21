//
//  ProfileHeaderReusable.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 21/05/21.
//

import UIKit

class ProfileHeaderReusable: UICollectionReusableView {
    
    // MARK: - Propertis
    
    let profileImageView:UIImageView = {
        let profileImgView = UIImageView()
        profileImgView.image = #imageLiteral(resourceName: "venom-7")
        profileImgView.contentMode = .scaleAspectFill
        profileImgView.setWidth(80)
        profileImgView.setHeight(80)
        profileImgView.layer.cornerRadius = 80 / 2
        profileImgView.clipsToBounds = true
        profileImgView.layer.borderWidth = 1
        profileImgView.layer.borderColor = UIColor.black.cgColor
        return profileImgView
    }()
    
    let profileNameLable:UILabel = {
       let profNamLab = UILabel()
        profNamLab.text = "Venom"
        profNamLab.textAlignment = .center
        profNamLab.font = UIFont.boldSystemFont(ofSize: 14)
        return profNamLab
    }()

    let editProfileBtn: UIButton = {
        let editProBtn = UIButton(type: .system)
        editProBtn.setTitle("Edit Profile", for: .normal)
        editProBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        editProBtn.layer.borderColor = UIColor.systemGray.cgColor
        editProBtn.layer.borderWidth = 0.5
        editProBtn.layer.cornerRadius = 3
        editProBtn.setTitleColor(.black, for: .normal)
        editProBtn.isEnabled = true
        return editProBtn
    }()
    
    private lazy var postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.numberOfLines = 0
        postLabel.textAlignment = .center
        postLabel.attributedText = setProfileAttributedText(numberValue: "5",titleName: "posts")
        return postLabel
    }()
    
    private lazy var followersLabel: UILabel = {
        let followersLabel = UILabel()
        followersLabel.numberOfLines = 0
        followersLabel.textAlignment = .center
        followersLabel.attributedText = setProfileAttributedText(numberValue: "1",titleName: "followers")
        return followersLabel
    }()
    
    private lazy var followingLabel: UILabel = {
        let followingLabel = UILabel()
        followingLabel.numberOfLines = 0
        followingLabel.textAlignment = .center
        followingLabel.attributedText = setProfileAttributedText(numberValue: "4",titleName: "following")
        return followingLabel
    }()
    
    let gridBtn: UIButton = {
        let gridBtn = UIButton(type: .system)
        gridBtn.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        return gridBtn
    }()
    
    let listBtn: UIButton = {
        let listBtn = UIButton(type: .system)
        listBtn.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        listBtn.tintColor = .gray
        return listBtn
    }()
    
    let bookmarkBtn: UIButton = {
        let bookmarkBtn = UIButton(type: .system)
        bookmarkBtn.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        bookmarkBtn.tintColor = .gray
        return bookmarkBtn
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
        
        backgroundColor = .white
        
        // add Post image to view
        addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // add ProfileName Lable
        
        addSubview(profileNameLable)
        profileNameLable.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12).isActive = true
        profileNameLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileNameLable.rightAnchor.constraint(equalTo: profileImageView.rightAnchor).isActive = true
        profileNameLable.translatesAutoresizingMaskIntoConstraints = false
        
        // Add EditProfile Btn
        addSubview(editProfileBtn)
        editProfileBtn.topAnchor.constraint(equalTo: profileNameLable.bottomAnchor, constant: 16).isActive = true
        editProfileBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        editProfileBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        editProfileBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileNameLable)
        
        
        // Add StackView for post,followers, following label
        
        let stackView = UIStackView(arrangedSubviews: [postLabel,
                                                       followersLabel,
                                                       followingLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        stackView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        stackView.centerY(inView: profileImageView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // add stack for grid,bookmark,list btn
        
        let stack = UIStackView(arrangedSubviews: [gridBtn,listBtn,bookmarkBtn])
        stack.distribution = .fillEqually
        
        addSubview(stack)
        stack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        stack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stack.setHeight(50)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Divider top and bottom of stack view (grid,bookmar,list)
        
        let topDivider = UIView()
        topDivider.backgroundColor = .gray
        addSubview(topDivider)

//        topDivider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
//        topDivider.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        topDivider.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        topDivider.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        topDivider.translatesAutoresizingMaskIntoConstraints = true
        
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = . gray
        addSubview(topDivider)
        
//        bottomDivider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
//        bottomDivider.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        bottomDivider.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        bottomDivider.bottomAnchor.constraint(equalTo: stack.bottomAnchor).isActive = true
        bottomDivider.translatesAutoresizingMaskIntoConstraints = true

    }
    
    func setProfileAttributedText(numberValue:String, titleName:String) -> NSAttributedString{
        let profileAtrributedText = NSMutableAttributedString(string: "\(numberValue)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
        profileAtrributedText.append(NSAttributedString(string: titleName, attributes: [.foregroundColor: UIColor.gray, .font: UIFont.boldSystemFont(ofSize: 16)]))
        return profileAtrributedText
    }

}
