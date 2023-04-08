//
//  HastagCollectionViewCell.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 09.04.2023.
//
import UIKit
import SnapKit

class HashtagCollectionViewCell: UICollectionViewCell {
    
    let labelHashtag: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        contentView.addSubview(labelHashtag)
        labelHashtag.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
            
        }
        contentView.backgroundColor = .myVioletColor()
        contentView.layer.cornerRadius = 10
    }
}
