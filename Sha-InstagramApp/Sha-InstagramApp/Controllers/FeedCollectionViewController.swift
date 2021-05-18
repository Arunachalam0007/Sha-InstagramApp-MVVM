//
//  FeedViewController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 18/05/21.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

class FeedCollectionViewController: UICollectionViewController {
    
    // MARK: - Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register Collection Cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Helpers

    func setupUI() {
        collectionView.backgroundColor = .white
    }
    
    
    
}

// MARK: - CollectionView Datasource


extension FeedCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
    
}

// MARK: - UICollectionView Delegate Flow layout

extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width
        let cellHight = 200.0
        
        return CGSize(width: cellWidth, height: CGFloat(cellHight))
    }
}
