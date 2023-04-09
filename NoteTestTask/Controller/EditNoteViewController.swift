//
//  EditNoteViewController.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 08.04.2023.
//

import UIKit
import RealmSwift

class EditNoteViewController: EditNoteView {
    
    var noteData: NoteData?
    var editNote: Bool = false
    
    var selectedColor: String?
    var hashTag: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollections()
    }
    
    
    private func configureCollections() {
        if let noteData = noteData {
            editNote = true
            noteTitleText.text = noteData.titleNote
            noteDescriptionText.text = noteData.descriptionNote
            hashTag = noteData.tagNote
            selectedColor = noteData.colorNote
        } else {
            noteData = NoteData()
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        colorCollectionView.delegate = self
        hashtagCollectionView.delegate = self
        colorCollectionView.dataSource = self
        hashtagCollectionView.dataSource = self
    }
    
    @objc func saveData() {
        guard let noteData = noteData else {return}
        
        let title = noteTitleText.text ?? ""
        let description = noteDescriptionText.text ?? ""
        let color = selectedColor ?? "6A3EA1"
        let tag = hashTag ?? hashtags[0]
        

        if editNote {
            RealmManager.shared.updateData(data: noteData, withTitle: title, description: description, color: color, tag: tag)
        } else {
            let newNoteData = NoteData()
            newNoteData.titleNote = title
            newNoteData.descriptionNote = description
            newNoteData.colorNote = color
            newNoteData.tagNote = tag
            newNoteData.editedData = Date()
            RealmManager.shared.saveData(data: newNoteData)
        }
        navigationController?.popViewController(animated: true)
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
            cell.layer.cornerRadius = 10
            return cell
            
        } else if collectionView == hashtagCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierHashtag, for: indexPath) as! HashtagCollectionViewCell
            cell.labelHashtag.text = hashtags[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
        case colorCollectionView:
            switch indexPath.item {
            case 0: selectedColor = "FF6000"
            case 1: selectedColor = "C7E9B0"
            case 2: selectedColor = "009FBD"
            case 3: selectedColor = "6A3EA1"
            case 4: selectedColor = "27E1C1"
            case 5: selectedColor = "FFD93D"
            case 6: selectedColor = "FC2947"
            case 7: selectedColor = "FFBF9B"
            default: selectedColor = "6A3EA1"
            }
        case hashtagCollectionView:
            let selectedHashtag = hashtags[indexPath.item]
            hashTag = selectedHashtag
        default:
            hashTag = "personal"
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.alpha = 0.8
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.black.cgColor
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.alpha = 1
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 0
        }
    }
}




