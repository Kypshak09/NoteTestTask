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
    var pinnedNotes: Set<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        configureButton()
        configureQuote()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        data = realm.objects(NoteData.self)
        collectionView.reloadData()
        updateVisiability()
    }
    
    
    func configureQuote() {
        Request.shated.request { quote, error in
            if let quote = quote?.first {
                DispatchQueue.main.async {
                    self.labelTextDailyQuote.text = quote.q
                    self.labelAuthorDailyQuote.text = quote.a
                }
            } else if let error = error {
                print("Error fetching quote:", error.localizedDescription)
            }
        }
    }
    func sortedData() -> [NoteData] {
        guard let unsortedData = data else {
               return []
           }

        let unsortedArray = Array(unsortedData)
        let sortedData = unsortedArray.sorted { (first: NoteData, second: NoteData) -> Bool in
                if first.pinnedNote != second.pinnedNote {
                    return first.pinnedNote && !second.pinnedNote
                } else {
                    return first.editedData! > second.editedData!
                }
            }
        return sortedData
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
        return sortedData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        let note = sortedData()[indexPath.item]
        cell.buttonPin.addTarget(self, action: #selector(togglePinNote), for: .touchUpInside)
        cell.buttonPin.setImage(UIImage(systemName: note.pinnedNote ? "pin.fill": "pin"), for: .normal)
        cell.buttonDelete.addTarget(self, action: #selector(deleteNote), for: .touchUpInside)
        cell.labelTitle.text = note.titleNote
        cell.view.backgroundColor = UIColor().color(note.colorNote)
        cell.labelHashtag.text = note.tagNote
        cell.labelDescription.text = note.descriptionNote
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd HH:mm"
        let dateString = dateFormatter.string(from: note.editedData!)
        
        cell.labelLastEdited.text = dateString
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editNoteVC = EditNoteViewController()
        editNoteVC.noteData = sortedData()[indexPath.item]
        navigationController?.pushViewController(editNoteVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 252)
    }
}

