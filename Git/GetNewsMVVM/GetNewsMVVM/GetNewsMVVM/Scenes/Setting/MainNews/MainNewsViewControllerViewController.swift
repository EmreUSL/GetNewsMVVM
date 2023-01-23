//
//  ViewController.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import UIKit
import Foundation

class MainNewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MainNewsViewModelProtocol = MainNewsViewModel()
  
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
        viewModel.getNews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(cellType: MainNewsTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
       
    }
    
    
}

extension MainNewsViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: MainNewsTableViewCell.self, indePath: indexPath)
        let newsModel = viewModel.cellForRowAt(index: indexPath.row)
        cell.configure(newsModel: newsModel)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}

extension MainNewsViewController: MainNewsViewModelDelegate {
   
    func updateUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.reloadData()
        }
    }
    
}

