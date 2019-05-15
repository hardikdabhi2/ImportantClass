//
//  UserStructure.swift
//  RequiredClass
//
//  Created by Hardik on 15/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import Foundation
import UIKit


struct StructConst {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let mainSB = UIStoryboard(name:"Main", bundle: nil)
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
}
