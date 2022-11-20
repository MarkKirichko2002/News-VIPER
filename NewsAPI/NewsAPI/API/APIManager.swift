//
//  APIManager.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import Alamofire

class APIManager {
    
    var url = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7"
    
    func fetchTopNews(completion: @escaping ([Article])->()) {
        AF.request(url).response { response in
            guard let data = response.data else {return}
            
            var newsResponse: News?
            
            do {
                newsResponse = try JSONDecoder().decode(News.self, from: data)
                guard let news = newsResponse?.articles else {return}
                print(news)
                completion(news)
            } catch {
                print(error)
            }
        }
    }
}
