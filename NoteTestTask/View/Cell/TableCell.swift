//
//  TableCell.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 07.04.2023.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    let labelTitle = UILabel.createLabel(name: "", fontSize: 16, font: "Arial Bold", backgroundColor: .clear)
    let labelHashtag = UILabel.createLabel(name: "", fontSize: 14, font: "Arial", backgroundColor: .myHashtagColor())
    let labelDescription = UILabel.createLabel(name: "", fontSize: 12, font: "Arial", backgroundColor: .clear)
    let labelLastEdited = UILabel.createLabel(name: "", fontSize: 9, font: "Arial", backgroundColor: .clear)
    
    let buttonDelete = UIButton.createButtonCell(image: "trash.fill")
    let buttonPin = UIButton.createButtonCell(image: "pin.fill")
    let view = UIView.createView(color: .myVioletColor())
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(note: NoteData) {
        labelDescription.text = note.descriptionNote
        labelTitle.text = note.titleNote
        buttonPin.setImage(UIImage(systemName: note.pinnedNote ? "pin.fill" : "pin"), for: .normal)
        view.backgroundColor = UIColor().color(note.colorNote)
        labelHashtag.text = note.tagNote
        labelDescription.text = note.descriptionNote
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd HH:mm"
        let dateString = dateFormatter.string(from: note.editedData!)
        labelLastEdited.text = dateString
    }
    
    private func configureConstraint() {
        self.addSubview(view)
        view.layer.cornerRadius = 15
        view.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(156)
        }
        
        self.addSubview(labelHashtag)
        labelHashtag.textAlignment = .center
        labelHashtag.snp.makeConstraints { make in
            make.top.equalTo(view.snp_bottomMargin).offset(7)
            make.width.equalTo(156)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        view.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        view.addSubview(labelDescription)
        labelDescription.textAlignment = .left
        labelDescription.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(140)
            make.height.equalTo(150)
        }
        
        view.addSubview(buttonDelete)
        buttonDelete.snp.makeConstraints { make in
            make.top.equalTo(labelDescription.snp_bottomMargin).offset(7)
            make.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(15)
        }
        
        view.addSubview(buttonPin)
        buttonPin.snp.makeConstraints { make in
            make.top.equalTo(labelDescription.snp_bottomMargin).offset(7)
            make.left.equalToSuperview().offset(15)
            make.width.height.equalTo(15)
        }
        view.addSubview(labelLastEdited)
        labelLastEdited.layer.cornerRadius = 0
        labelLastEdited.snp.makeConstraints { make in
            make.top.equalTo(labelDescription.snp_bottomMargin).offset(10)
            make.left.equalTo(buttonPin.snp_rightMargin).offset(30)
        }
    }
}
