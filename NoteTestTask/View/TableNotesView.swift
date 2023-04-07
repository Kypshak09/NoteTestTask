//
//  TableNotesView.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 07.04.2023.
//

import UIKit
import SnapKit

class TableNotesView: UIViewController {
    
    let identifier = "CollectionViewIdentifier"
    
    let buttonNewNote: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus.square.fill")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor.myVioletColor()
        return button
    }()
    
    let searchField: UITextField = {
        let search = UITextField()
        search.placeholder = "Find your note"
        search.backgroundColor = UIColor.mySearchColor()
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        search.leftView = leftView
        search.leftViewMode = .always
        search.layer.cornerRadius = 15
        return search
    }()
    
    let labelEmptyNote: UILabel = {
        let label = UILabel()
        label.text = "No notes yet"
        label.font = UIFont(name: "Arial Bold", size: 24)
        return label
    }()
    
    let imageViewEmptyNote: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "noNote")
        return image
    }()
    
    let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 156, height: 200)
            layout.minimumInteritemSpacing = 4
            layout.minimumLineSpacing = 16
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.backgroundColor = .white
            collection.translatesAutoresizingMaskIntoConstraints = false
            return collection
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraint()
        view.backgroundColor = .white
    }
    private func configureConstraint() {
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(650)
        }
        
        view.addSubview(imageViewEmptyNote)
        imageViewEmptyNote.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        view.addSubview(labelEmptyNote)
        labelEmptyNote.snp.makeConstraints { make in
            make.top.equalTo(imageViewEmptyNote.snp_bottomMargin).offset(50)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
        
        view.addSubview(buttonNewNote)
        buttonNewNote.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-35)
            make.top.equalToSuperview().offset(680)
            make.width.height.equalTo(65)
        }
    }
    
}


