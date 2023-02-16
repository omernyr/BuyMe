//
//  UIImage + Extension.swift
//  BuyMe
//
//  Created by macbook pro on 16.02.2023.
//

import UIKit
import Kingfisher


extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
