//
//  ProfileViewController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 18/05/21.
//

import Foundation
import UIKit

private let headerIdentifier = "ProfileHeaderReusable" //UICollectionReusableView
private let cellIdentifier = "ProfileCell"

class ProfileCollectionViewController: UICollectionViewController {
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureCollectionView()
    }
    
   func configureCollectionView(){
        collectionView.backgroundColor = .white
    
        // Register Header
        collectionView.register(ProfileHeaderReusable.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // Register Cell
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
    }
}

// MARK: - Collection DataSource

extension ProfileCollectionViewController {
    
    // Header Cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileHeaderReusable
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
        return cell
    }
    
}


// MARK: - CollectionView Delegate


// MARK: - CollectionView Delegate FlowLyoutDelegate

extension ProfileCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    //referenceSizeForHeaderInSection it's for headerSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
    
    // minimumLineSpacingForSectionAt it's sapcing for top and bottom
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    // minimumInteritemSpacingForSectionAt it's spacing for left and right cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    // sizeForItem it's for Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width-2)/3
        return CGSize(width: width, height: width)
    }
    
}


