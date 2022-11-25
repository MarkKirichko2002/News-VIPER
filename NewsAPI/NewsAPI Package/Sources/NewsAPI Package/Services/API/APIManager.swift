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
    
    func fetchNews(url: String, completion: @escaping ([Article])->()) {
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
    
    func CurrentCategory(id: Int)-> String {
        switch id {
            
        case 1:
            url = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case 2:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case 3:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case 4:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case 5:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        default:
            break
        }
        return url
    }
}
