//
//  EditNoteView.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 08.04.2023.
//

import UIKit
import SnapKit

class EditNoteView: UIViewController {

    let colorCodes = ["FF6000", "C7E9B0", "009FBD", "6A3EA1", "27E1C1", "FFD93D", "FC2947", "FFBF9B"]
    var colors: [UIColor] { return colorCodes.map { UIColor().color($0) } }
    let hashtags: [String] = ["#personal", "#work", "#study", "#travel", "#hobby"]
    let identfierColor = "ColorCell"
    let identifierHashtag = "HastagCell"
    
    let colorCollectionView = UICollectionView.createCollectionView(itemSize: CGSize(width: 45, height: 45), scrollDirection: .horizontal, minimumInteritemSpacing: 5, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), showsHorizontalScrollIndicator: false, backgroundColor: .clear)
    
    let hashtagCollectionView = UICollectionView.createCollectionView(itemSize: CGSize(width: 60, height: 32), scrollDirection: .horizontal, minimumInteritemSpacing: 5, minimumLineSpacing: 10,sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), showsHorizontalScrollIndicator: false, backgroundColor: .clear)
    
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
        text.font = UIFont.systemFont(ofSize: 16)
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
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        view.addSubview(hashtagCollectionView)
        hashtagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(colorCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview()
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

