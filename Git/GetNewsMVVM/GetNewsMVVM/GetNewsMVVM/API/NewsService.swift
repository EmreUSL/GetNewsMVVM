//
//  NewsService.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import Foundation
import Alamofire

//1c1848fcebe647799aa01baf7625e51f

protocol NewsServiceProtocol {
    func getNews(country: String? , completion: @escaping (Result<NewsModel,Error>) -> Void)
}

class NewsService: NewsServiceProtocol {
    
    func getNews(country: String? , completion: @escaping (Result<NewsModel, Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country ?? "us")&apiKey=6330ff9b6c0043969972d367f745cd83"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let newsList = try decoder.decode(NewsModel.self, from: data)
                    print(newsList)
                    completion(.success(newsList))
                } catch  {
                    print("**** JSON DECODE ERROR")
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    

}
