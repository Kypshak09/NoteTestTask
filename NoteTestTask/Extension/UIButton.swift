//
//  UIButton.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 11.04.2023.
//

import UIKit

extension UIButton {
    static func createButtonCell(image: String) -> UIButton {
        let button: UIButton = {
            let button = UIButton()
            let image = UIImage(systemName: image)
            button.setImage(image, for: .normal)
            button.tintColor = .black
            return button
        }()
        return button
    }
}
