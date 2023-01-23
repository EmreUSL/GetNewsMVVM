//
//  MainNewsViewModel.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import Foundation


protocol MainNewsViewModelProtocol {
    var delegate: MainNewsViewModelDelegate? { get set }
    var numberOfRow: Int { get }
    func cellForRowAt(index: Int) -> Article
    func getNews()

}

protocol MainNewsViewModelDelegate {
    func updateUI()
}

final class MainNewsViewModel: MainNewsViewModelProtocol {
    
    
    var delegate: MainNewsViewModelDelegate?
    private var service: NewsServiceProtocol = NewsService()
    var news: [Article] =  []
    
    
    func getNews() {
        service.getNews(country: Country.country) { response in
            switch response {
            case .success(let result):
                guard let result = result.articles else {
                    return
                }
                self.news = result
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    var numberOfRow: Int {
        news.count
    }
    
    func cellForRowAt(index: Int) -> Article {
        news[index]
    }
}
