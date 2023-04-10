//
//  UICollectionView.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 11.04.2023.
//

import UIKit

extension UICollectionView {
    static func createCollectionView(itemSize: CGSize,
                                     scrollDirection: UICollectionView.ScrollDirection = .vertical,
                                     minimumInteritemSpacing: CGFloat = 0,
                                     minimumLineSpacing: CGFloat = 0,
                                     sectionInset: UIEdgeInsets = .zero,
                                     showsHorizontalScrollIndicator: Bool = true,
                                     showsVerticalScrollIndicator: Bool = true,
                                     backgroundColor: UIColor = .white) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = itemSize
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.sectionInset = sectionInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        collectionView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        collectionView.backgroundColor = backgroundColor
        
        return collectionView
    }
}
