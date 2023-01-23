//
//  UITableViewCell.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

