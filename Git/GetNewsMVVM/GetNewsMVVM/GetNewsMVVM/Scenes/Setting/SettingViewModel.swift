//
//  SettingViewModel.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import Foundation
import UIKit


protocol SettingViewModelProtocol {
    var delegate: SettingViewModelDelegate? { get set }
    var numberOfRows: Int { get }
    func cellForRowAt(index: Int) -> String
    func didSelectRow(index: Int)
    func checkMark(index: IndexPath , tableView: UITableView) -> UITableViewCell.AccessoryType
    func getbarItem(index: Int) -> String?
}

protocol SettingViewModelDelegate {

}

final class SettingViewModel : SettingViewModelProtocol {
 
    var delegate: SettingViewModelDelegate?
    var countries = CountryModel().countries
    var setCountry:String?
    var array: [Int]?
    var chosen:Int?
    
    var numberOfRows: Int {
        countries.count
    }
    
    func cellForRowAt(index: Int) -> String {
        let countries = Array(countries.keys)
        return countries[index]
    }
    
    func didSelectRow(index: Int) {
        let countries = Array(countries.values)
        setCountry = countries[index]
        chosen = index
        Country.country = setCountry!
    }
  
    func checkMark(index: IndexPath , tableView: UITableView) -> UITableViewCell.AccessoryType {
        
        if tableView.cellForRow(at: index)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            return UITableViewCell.AccessoryType.none
        } else {
            for index in 0...numberOfRows{
                if tableView.cellForRow(at: [0, index])?.accessoryType == UITableViewCell.AccessoryType.checkmark && index != chosen{
                    tableView.cellForRow(at: [0, index])?.accessoryType = .none
                }
            }
            return .checkmark
        }
    }
    
    func getbarItem(index: Int) -> String? {
        let countries = Array(countries.keys)
        return countries[index]
    }
    
    func get() {
        
    }
}
