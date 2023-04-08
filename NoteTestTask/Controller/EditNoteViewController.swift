//
//  EditNoteViewController.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 08.04.2023.
//

import UIKit
import RealmSwift

class EditNoteViewController: EditNoteView {
    
    let noteData = NoteData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollections()
    }
    
    
    private func configureCollections() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        colorCollectionView.delegate = self
        hashtagCollectionView.delegate = self
        colorCollectionView.dataSource = self
        hashtagCollectionView.dataSource = self
    }
    
    @objc func saveData() {
    
        noteData.titleNote = noteTitleText.text ?? ""
        noteData.descriptionNote = noteDescriptionText.text ?? ""
        RealmManager.shared.saveData(data: noteData)
        
    }
    
}
extension EditNoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorCollectionView {
            return colors.count
        } else {
            return hashtags.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colorCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identfierColor, for: indexPath)
            cell.backgroundColor = colors[indexPath.item]
            cell.layer.cornerRadius = cell.frame.width / 2
            return cell
            
        } else if collectionView == hashtagCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierHashtag, for: indexPath) as! HashtagCollectionViewCell
            cell.labelHashtag.text = hashtags[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension EditNoteViewController: UITextViewDelegate {
    
}


