//
//  UIImage.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import UIKit

extension UIImage {
    func resize(width: CGFloat) -> UIImage? {
        let newSize = CGSize(width: width, height: size.height * width / size.width)
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        draw(in: CGRect(origin: .zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

