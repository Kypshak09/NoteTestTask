//
//  ViewController.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 06.04.2023.
//

import UIKit


class NotesViewController: TableNotesView {

    var data: [String] = ["Amir", "Tair", "Rama", "Baha", "Adil"] {
        didSet {
            collectionView.isHidden = data.isEmpty
            imageViewEmptyNote.isHidden = !data.isEmpty
            labelEmptyNote.isHidden = !data.isEmpty
            
            collectionView.reloadData()
        }
    }
    
    var dataDescription = ["asmsmsm", "akljkaldlkd", "", "", ""]
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
    }
    
}

extension NotesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        cell.labelTitle.text = data[indexPath.row]
        cell.labelDescription.text = dataDescription[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 252)
    }
}

