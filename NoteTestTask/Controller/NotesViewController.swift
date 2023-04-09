//
//  ViewController.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 06.04.2023.
//

import UIKit
import RealmSwift



class NotesViewController: TableNotesView {

    let realm = try! Realm()
    var data: Results<NoteData>!
    let noteData = NoteData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        data = realm.objects(NoteData.self)
        collectionView.reloadData()
        updateVisiability()
    }
    
    
    
    private func configureButton() {
        buttonNewNote.addTarget(self, action: #selector(goToTest), for: .touchUpInside)
        
    }
    
    @objc func goToTest() {
        navigationController?.pushViewController(EditNoteViewController(), animated: true)
    }
    
    @objc func deleteNote(sender: UIButton) {
        guard let cell = sender.superview?.superview as? CollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell) else { return }
            let note = data[indexPath.item]
            RealmManager.shared.deleteData(data: note)
            collectionView.deleteItems(at: [indexPath])
        updateVisiability()
    }
    
    @objc func pinNote() {
        
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        updateVisiability()
        
    }
    
    private func updateVisiability() {
        if let data = data, !data.isEmpty {
            collectionView.isHidden = false
            imageViewEmptyNote.isHidden = true
            labelEmptyNote.isHidden = true
        } else {
            collectionView.isHidden = true
            imageViewEmptyNote.isHidden = false
            labelEmptyNote.isHidden = false
        }
    }
    
}

extension NotesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        let note = data[indexPath.item]
        cell.buttonPin.addTarget(self, action: #selector(pinNote), for: .touchUpInside)
        cell.buttonDelete.addTarget(self, action: #selector(deleteNote), for: .touchUpInside)
        cell.labelTitle.text = note.titleNote
        cell.view.backgroundColor = UIColor().color(note.colorNote)
        cell.labelHashtag.text = note.tagNote
        cell.labelDescription.text = note.descriptionNote
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editNoteVC = EditNoteViewController()
        editNoteVC.noteData = data[indexPath.item]
        navigationController?.pushViewController(editNoteVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 252)
    }
}

