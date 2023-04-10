//
//  UIView.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 11.04.2023.
//

import UIKit

extension UIView {
    static func createView(color: UIColor) -> UIView {
        let view: UIView = {
            let view = UIView()
            view.backgroundColor = color
            return view
        }()
        return view
    }
}
