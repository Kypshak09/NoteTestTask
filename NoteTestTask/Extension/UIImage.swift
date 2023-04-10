//
//  UIImage.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 10.04.2023.
//

import UIKit

extension UIImageView {
    
    static func createImage(name: String) -> UIImageView{
        let image: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleToFill
            image.image = UIImage(named: name)
            return image
        }()
        return image
    }
}
