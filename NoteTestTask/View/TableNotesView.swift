//
//  TableNotesView.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 07.04.2023.
//

import UIKit
import SnapKit

class TableNotesView: UIViewController {
    
    let tableNotes: UICollectionView = {
        var table = UICollectionView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        table = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNotes.dataSource = self
        tableNotes.delegate = self
        tableNotes.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        configureConstraint()
    }
    
    func configureConstraint() {
        view.addSubview(tableNotes)
        tableNotes.snp.makeConstraints { make in
            
        }
    }
    
}

extension TableNotesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    
}
