//
//  HDImages.swift
//  PhilipsFlag
//
//  Created by Hardik on 08/10/18.
//  Copyright © 2018 Innopadsolutions. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class HDImages:UIImageView
{
    @IBInspectable
    public var cornerRadius:CGFloat = 0
    {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    public var maskToBound:Bool = false
    {
        didSet{
            layer.masksToBounds = maskToBound
        }
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
}
