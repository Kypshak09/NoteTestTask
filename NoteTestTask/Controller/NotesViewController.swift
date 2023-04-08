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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollection()
    }
    
    private func configureCollection() {
        collectionView.isHidden = data.isEmpty
        imageViewEmptyNote.isHidden = !data.isEmpty
        labelEmptyNote.isHidden = !data.isEmpty
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        data = realm.objects(NoteData.self)
    }
    
}

extension NotesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 252)
    }
}

