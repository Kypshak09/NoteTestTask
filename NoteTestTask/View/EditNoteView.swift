//
//  EditNoteView.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 08.04.2023.
//

import UIKit
import SnapKit

class EditNoteView: UIViewController {

    let colors: [UIColor] = [.myOrangeColor(), .myGreenColor(), .myBlueColor(), .myVioletColor(),.myCyanColor(),.myYellowColor(), .myRedColor(), .mySomeColor()]
    let hashtags: [String] = ["#personal", "#work", "#study", "#travel", "#hobby"]
    let identfierColor = "ColorCell"
    let identifierHashtag = "HastagCell"
    
    lazy var colorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 45, height: 45)
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identfierColor)
        return collectionView
       }()
    
    lazy var hashtagCollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.itemSize = CGSize(width: 60, height: 32)
           layout.minimumInteritemSpacing = 5
           layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.showsHorizontalScrollIndicator = false
           collectionView.backgroundColor = .clear
           collectionView.register(HashtagCollectionViewCell.self, forCellWithReuseIdentifier: identifierHashtag)
           return collectionView
       }()
    
    let noteTitleText: UITextField = {
        let text = UITextField()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        text.leftView = leftView
        text.leftViewMode = .always
        text.placeholder = "Note title"
        text.layer.cornerRadius = 10
        text.backgroundColor = .mySearchColor()
        return text
    }()
    
    let noteDescriptionText: UITextView = {
        let text = UITextView()
        text.layer.cornerRadius = 10
        text.backgroundColor = .mySearchColor()
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraint()
    }
    
    
    
    private func configureConstraint() {
        navigationController?.navigationBar.tintColor = UIColor.myVioletColor()
        
        view.addSubview(noteTitleText)
        noteTitleText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(60)
            
        }
        
        view.addSubview(colorCollectionView)
        colorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(noteTitleText.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        view.addSubview(hashtagCollectionView)
        hashtagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(colorCollectionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
                }
        
        view.addSubview(noteDescriptionText)
        noteDescriptionText.snp.makeConstraints { make in
            make.top.equalTo(hashtagCollectionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-60)
        }
        
        
    }

}

