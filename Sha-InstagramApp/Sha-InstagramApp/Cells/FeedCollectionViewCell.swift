//
//  FeedCollectionViewCell.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 18/05/21.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "venom-7")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    } ()
    
   private lazy var profileNameBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Venom", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(userBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private let postImageView: UIImageView = {
        var postImage = UIImageView()
        postImage.image = UIImage(named: "venom-7")
        postImage.contentMode = .scaleAspectFill
        postImage.clipsToBounds = true
        postImage.isUserInteractionEnabled = true
        return postImage
    }()
    
    private let likeBtn: UIButton = {
        var likeBtn = UIButton()
        likeBtn.setImage(UIImage(named: "like_unselected"), for: .normal)
        likeBtn.addTarget(self, action: #selector(userBtnTapped), for: .touchUpInside)
        likeBtn.tintColor = .black
        return likeBtn
    }()
    
    private let commentBtn: UIButton = {
        var commentBtn = UIButton()
        commentBtn.setImage(UIImage(named: "comment"), for: .normal)
        commentBtn.tintColor = .black
        return commentBtn
    }()
    
    private let shareBtn: UIButton = {
        var shareBtn = UIButton()
        shareBtn.setImage(UIImage(named: "send2"), for: .normal)
        shareBtn.tintColor = .black
        return shareBtn
    }()
    
    private let likeLabel: UILabel = {
        var likeLab = UILabel()
        likeLab.text = "1 Likes"
        likeLab.font = UIFont.boldSystemFont(ofSize: 13)
        return likeLab
    }()
    
    private let captionLabel: UILabel = {
        var captionLabel = UILabel()
        captionLabel.text = "Some Text caption for Now"
        captionLabel.font = UIFont.systemFont(ofSize: 14)
        return captionLabel
    }()
    private let postTimeLabel: UILabel = {
        var postTimeLabel = UILabel()
        postTimeLabel.text = "2 days ago"
        postTimeLabel.font = UIFont.systemFont(ofSize: 12)
        postTimeLabel.textColor = .lightGray
        return postTimeLabel
    }()
    
    
    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers

    @objc func userBtnTapped(_ btn: UIButton) {
        print("User Btn Got Tapped ",btn.titleLabel?.text)
        
    }
    

    
    
    func setupUI() {
        backgroundColor = .white
        self.addSubview(profileImageView)
        
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        profileImageView.layer.cornerRadius = 40/2
        
        profileImageView.topAnchor.constraint(equalTo: topAnchor,constant: 12 ).isActive = true

        profileImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 12).isActive = true
        
        //If you want to use Auto Layout to dynamically calculate the size and position of your view, you must set this property to false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
      // profileViewBtn
        self.addSubview(profileNameBtn)
        profileNameBtn.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 2).isActive = true
        profileNameBtn.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
        
        
        profileNameBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        // PostImageView
        self.addSubview(postImageView)
        
        postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true

        postImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        

        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView Btns
        getStackBtnView()
        
        // Like Label
        self.addSubview(likeLabel)
        likeLabel.topAnchor.constraint(equalTo: likeBtn.bottomAnchor, constant: -10).isActive = true
        likeLabel.leftAnchor.constraint(equalTo: likeBtn.leftAnchor, constant: 8).isActive = true
        
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Caption Label
        self.addSubview(captionLabel)
        captionLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 8).isActive = true
        captionLabel.leftAnchor.constraint(equalTo: likeLabel.leftAnchor, constant: 0).isActive = true
        captionLabel.widthAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true
        
        captionLabel.adjustsFontSizeToFitWidth = true // Automatically adjuest fonts
        
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // postTime Label
        self.addSubview(postTimeLabel)
        postTimeLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 8).isActive = true
        postTimeLabel.leftAnchor.constraint(equalTo: captionLabel.leftAnchor, constant: 0).isActive = true
        
        postTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // StackView for like,comment,share btn
    func getStackBtnView() {
        let stackBtnView = UIStackView(arrangedSubviews: [likeBtn,commentBtn,shareBtn])
        stackBtnView.axis = .horizontal
        stackBtnView.distribution = .fillEqually
        
        self.addSubview(stackBtnView)
        
        stackBtnView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        stackBtnView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackBtnView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 0).isActive = true
        
        stackBtnView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
