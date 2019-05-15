//
//  Extension.swift
//  RequiredClass
//
//  Created by Hardik on 15/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import Foundation
import UIKit

public func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


var imageCatch = NSCache<AnyObject,AnyObject>()
extension UIImageView
{
    func loadImagesWithCacheWithUrlString(strUrl:String)
    {
        if let catchImage = imageCatch.object(forKey: strUrl as AnyObject) as? UIImage
        {
            self.image = catchImage
            return
        }
        
        let url  = NSURL(string: strUrl)
        let request = URLRequest(url: url! as URL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            DispatchQueue.main.async {
                if let downloadImage = UIImage(data:data)
                {
                    imageCatch.setObject(downloadImage, forKey:strUrl as AnyObject)
                    self.image = downloadImage
                }
            }
        }
        task.resume()
    }
}

