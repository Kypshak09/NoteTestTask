//
//  ViewController.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 06.04.2023.
//

import UIKit
import RealmSwift



class NotesViewController: TableNotesView {

    var data: Results<NoteData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        configureButton()
        configureQuote()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        data = RealmManager.shared.localRealm.objects(NoteData.self)
        collectionView.reloadData()
        updateVisiability()
    }
    
    
    private func configureQuote() {
        Request.shated.request { quote, error in
            if let quote = quote?.first {
                DispatchQueue.main.async {
                    self.labelTextDailyQuote.text = quote.q
                    self.labelAuthorDailyQuote.text = "- \(quote.a)"
                }
            } else if let error = error {
                print("Error fetching quote:", error.localizedDescription)
            }
        }
    }
    private func sortedData() -> [NoteData] {
        guard let unsortedData = data else { return [] }

        let unsortedArray = Array(unsortedData)
        return unsortedArray.sorted { (first, second) in
                    if first.pinnedNote != second.pinnedNote {
                        return first.pinnedNote && !second.pinnedNote
                    } else {
                        return first.editedData! > second.editedData!
                    }
                }
    }
    
    private func configureButton() {
        buttonNewNote.addTarget(self, action: #selector(goToEditNote), for: .touchUpInside)
    }
    
    @objc func goToEditNote() {
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
    
    @objc func togglePinNote(sender: UIButton) {
        guard let cell = sender.superview?.superview as? CollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else {return}
        let note = sortedData()[indexPath.item]
        let pinned = !note.pinnedNote
        RealmManager.shared.updateData(data: note, withTitle: nil, description: nil, color: nil, tag: nil, pinned: pinned)
        collectionView.reloadData()
    }
    
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        updateVisiability()
        
    }
    
    private func updateVisiability() {
        let isEmpty = data?.isEmpty ?? true
        collectionView.isHidden = isEmpty
        imageViewEmptyNote.isHidden = !isEmpty
        labelEmptyNote.isHidden = !isEmpty
    }
    
}

extension NotesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        let note = sortedData()[indexPath.item]
        cell.buttonPin.addTarget(self, action: #selector(togglePinNote), for: .touchUpInside)
        cell.buttonDelete.addTarget(self, action: #selector(deleteNote), for: .touchUpInside)
        cell.configureData(note: note)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editNoteVC = EditNoteViewController()
        editNoteVC.noteData = sortedData()[indexPath.item]
        navigationController?.pushViewController(editNoteVC, animated: true)
    }
}

