//
//  UIColor+Extensions.swift
//  HelloAR
//
//  Created by Kaan Koç on 23.09.2023.
//

import Foundation
import UIKit


extension UIColor {
    
    static func random() -> UIColor {
        
        UIColor(
            displayP3Red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1
        )
    }
}
