//
//  UITableView.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cellType: UITableViewCell.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.identifier)

    }
    
    func dequeCell<T: UITableViewCell>(cellType:T.Type,indePath:IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier, for: indePath) as? T else {
            fatalError("An error has occured")
        }
        return cell
    }
}
