//
//  UILabel.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 10.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    static func createLabel(name: String, fontSize: Int, font: String?, backgroundColor: UIColor?) -> UILabel {
        let label: UILabel = {
            let label = UILabel()
            label.text = "\(name)"
            label.font = UIFont(name: font ?? "Arial", size: CGFloat(fontSize))
            label.numberOfLines = 0
            label.layer.cornerRadius = 10
            label.layer.masksToBounds = true
            label.backgroundColor = backgroundColor
            return label
        }()
        return label
    }
 }
