//
//  ButtonTappedProtocol.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 08.04.2023.
//

import Foundation

protocol ButtonTappedDelegate: AnyObject {
    func didTapButton(cell: CollectionViewCell)
}
