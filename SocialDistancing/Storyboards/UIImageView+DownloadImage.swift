//
//  UIImageView+DownloadImage.swift
//  SocialDistancing
//
//  Created by andrea roveres on 06/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func imageFromServerURL(_ urlString: String, imagePlaceHolder: UIImage = UIImage(), contentMode: UIView.ContentMode = .scaleToFill) {
        
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print("ERROR when loading image from url: \(String(describing: error))")
                    DispatchQueue.main.async {
                        self.image = imagePlaceHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                            self.image = downloadedImage
                            self.contentMode = contentMode
                        }
                    }
                }
            }).resume()
        }
    }
}
