//
//  TableCell.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 07.04.2023.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Bold", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let labelLastEdited: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 9)
        label.textColor = .black
        label.text = "Last edited 12:23"
        label.textAlignment = .right
        return label
    }()
    
    let buttonDelete: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "trash.fill")
        button.tintColor = .black
        button.setImage(image, for: .normal)
        return button
    }()
    
    let buttonPin: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "pin.fill")
        button.tintColor = .black
        button.setImage(image, for: .normal)
        return button
    }()
    
    let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.myVioletColor()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(indexPath: IndexPath, dataTitle: [String], dataDescription: [String]) {
        labelDescription.text = dataDescription[indexPath.row]
        labelTitle.text = dataTitle[indexPath.row]
    }
    
    private func configureConstraint() {
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(156)
        }
        
        view.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        view.addSubview(labelDescription)
        labelDescription.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(140)
            make.height.equalTo(150)
        }
        
        view.addSubview(buttonDelete)
        buttonDelete.snp.makeConstraints { make in
            make.top.equalTo(labelDescription.snp_bottomMargin).offset(7)
            make.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(15)
        }
        
        view.addSubview(buttonPin)
        buttonPin.snp.makeConstraints { make in
            make.top.equalTo(labelDescription.snp_bottomMargin).offset(7)
            make.left.equalToSuperview().offset(15)
            make.width.height.equalTo(15)
        }
        view.addSubview(labelLastEdited)
        labelLastEdited.snp.makeConstraints { make in
            make.top.equalTo(labelDescription.snp_bottomMargin).offset(7)
            make.left.equalTo(buttonPin.snp_rightMargin).offset(23)
        }
    }
}
