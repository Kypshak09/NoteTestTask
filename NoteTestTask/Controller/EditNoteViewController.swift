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
        registerCells()
        setUpNotes()
        setUpNavigationBar()
        setDelegatesDataSource()
    }
    
    private func registerCells() {
        colorCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identfierColor)
        hashtagCollectionView.register(HashtagCollectionViewCell.self, forCellWithReuseIdentifier: identifierHashtag)
    }
    
    private func setUpNotes() {
        if let noteData = noteData {
            editNote = true
            noteTitleText.text = noteData.titleNote
            noteDescriptionText.text = noteData.descriptionNote
            hashTag = noteData.tagNote
            selectedColor = noteData.colorNote
        } else {
            noteData = NoteData()
        }
    }
    
    private func setUpNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
    }
    
    private func setDelegatesDataSource() {
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


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension EditNoteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == colorCollectionView ? colors.count : hashtags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == colorCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identfierColor, for: indexPath)
            cell.backgroundColor = colors[indexPath.item]
            cell.layer.cornerRadius = 10
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierHashtag, for: indexPath) as! HashtagCollectionViewCell
            cell.labelHashtag.text = hashtags[indexPath.item]
            return cell
        }
    }
    
    private func cellConfigure(cell: UICollectionViewCell, isSelected: Bool) {
        cell.alpha = isSelected ? 0.8 : 1
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = isSelected ? 3 : 0
        cell.layer.borderColor = isSelected ? UIColor.black.cgColor : nil
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case colorCollectionView:
            selectedColor = colorCodes[indexPath.item]
        case hashtagCollectionView:
            let selectedHashtag = hashtags[indexPath.item]
            hashTag = selectedHashtag
        default:
            hashTag = "personal"
        }
        if let cell = collectionView.cellForItem(at: indexPath) {
            cellConfigure(cell: cell, isSelected: true)
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cellConfigure(cell: cell, isSelected: false)
        }
    }
}




