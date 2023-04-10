//
//  HastagCollectionViewCell.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 09.04.2023.
//
import UIKit
import SnapKit

class HashtagCollectionViewCell: UICollectionViewCell {
    
    let labelHashtag = UILabel.createLabel(name: "", fontSize: 10, font: nil, backgroundColor: .clear)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        contentView.addSubview(labelHashtag)
        labelHashtag.textAlignment = .center
        labelHashtag.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
            
        }
        contentView.backgroundColor = .myCellHashtagColor()
        contentView.layer.cornerRadius = 10
    }
}
