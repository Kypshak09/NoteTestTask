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
    
    let viewQuote = UIView.createView(color: .myVioletColor())
    
    let imageViewEmptyNote = UIImageView.createImage(name: "noNote")
    let quoteImage = UIImageView.createImage(name: "quote")
    
    let labelTextDailyQuote = UILabel.createLabel(name: "", fontSize: 12, font: nil, backgroundColor: .clear)
    let labelTitleDailyQuote = UILabel.createLabel(name: "Daily Quote", fontSize: 20, font: "Arial Bold", backgroundColor: .clear)
    let labelEmptyNote = UILabel.createLabel(name: "No notes yet", fontSize: 24, font: "Arial Bold", backgroundColor: .clear)
    let labelAuthorDailyQuote = UILabel.createLabel(name: "", fontSize: 12, font: nil, backgroundColor: .clear)
    let buttonNewNote = UIButton.createButtonCell(image: "plus.square.fill")
    
    let collectionView = UICollectionView.createCollectionView(itemSize: CGSize(width: 156, height: 200), minimumInteritemSpacing: 4, minimumLineSpacing: 16, backgroundColor: .white)
    
    let searchField: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Find your note"
        search.layer.borderWidth = 1;
        search.layer.borderColor = UIColor.black.cgColor
        search.searchTextField.backgroundColor = .clear
        search.layer.cornerRadius = 15
        search.tintColor = .black
        search.sizeToFit()
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraint()
        view.backgroundColor = .white
    }
    private func configureConstraint() {
        
        view.addSubview(viewQuote)
        viewQuote.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
            make.width.equalToSuperview()
        }
        
        viewQuote.addSubview(quoteImage)
        quoteImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        viewQuote.addSubview(labelTitleDailyQuote)
        labelTitleDailyQuote.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(178)
            make.height.equalTo(50)
        }
        
        viewQuote.addSubview(labelTextDailyQuote)
        labelTextDailyQuote.snp.makeConstraints { make in
            make.top.equalTo(labelTitleDailyQuote.snp_bottomMargin).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-90)
            make.height.equalTo(30)
        }
        
        viewQuote.addSubview(labelAuthorDailyQuote)
        labelAuthorDailyQuote.snp.makeConstraints { make in
            make.top.equalTo(labelTextDailyQuote.snp_bottomMargin).offset(5)
            make.leading.equalToSuperview().offset(150)
            make.height.equalTo(30)
        }
        
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalTo(viewQuote.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp_bottomMargin).offset(24)
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
        view.addSubview(buttonNewNote)
        buttonNewNote.contentVerticalAlignment = .fill
        buttonNewNote.contentHorizontalAlignment = .fill
        buttonNewNote.imageView?.contentMode = .scaleAspectFit
        buttonNewNote.tintColor = UIColor.myVioletColor()
        buttonNewNote.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-35)
            make.top.equalToSuperview().offset(680)
            make.width.height.equalTo(65)
        }
    }
}


