//
//  SettingViewController.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import UIKit



class SettingViewController: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: SettingViewModelProtocol = SettingViewModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.delegate = self
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.cellForRowAt(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(index: indexPath.row)
        tableView.cellForRow(at: indexPath)?.accessoryType = viewModel.checkMark(index: indexPath, tableView: tableView)
        
    }
    
}

extension SettingViewController: SettingViewModelDelegate {
   
}
