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
    
    var urls = ["https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7", "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=0532857d0c9949ab8d5979e5153377b7", "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=0532857d0c9949ab8d5979e5153377b7", "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=0532857d0c9949ab8d5979e5153377b7", "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=0532857d0c9949ab8d5979e5153377b7"]
    
    var player = SoundClass()
    
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
            
        case 6:
            url = GenerateRandomUrl()
            
        default:
            break
        }
        return url
    }
    
    func RecognizeCurrentCategory(category: String)-> String {
        switch category {
            
        case _ where category.lowercased().contains("главное"):
            url = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case _ where category.lowercased().contains("техно"):
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case _ where category.lowercased().contains("спорт"):
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case _ where category.lowercased().contains("бизнес"):
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case _ where category.lowercased().contains("развлеч"):
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=0532857d0c9949ab8d5979e5153377b7"
            
        case _ where category.lowercased().contains("случай"):
            url = GenerateRandomUrl()
        
        default:
            break
            
        }
        
        return url
        
    }
    
    func GenerateRandomUrl()->String {
        while urls.count > 0 {
            
            let arrayKey = Int(arc4random_uniform(UInt32(urls.count)))
            
            let randURL = urls[arrayKey]
            
            urls.swapAt(arrayKey, urls.count-1)
            urls.removeLast()
            url = randURL
        }
        return url
    }
}
