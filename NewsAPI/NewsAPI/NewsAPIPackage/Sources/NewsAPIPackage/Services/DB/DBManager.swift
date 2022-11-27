//
//  DBManager.swift
//  NewsAPI
//
//  Created by Марк Киричко on 22.11.2022.
//

import Foundation
import CoreData
import UIKit

@available(iOS 13.0, *)
class DBManager {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let apiManager = APIManager()
    
    func LoadData(completion: @escaping([NewsDB])->()) {
        LoadNews { news in
            if news.count > 20 {
                self.DeleteNews(news: news)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.apiManager.fetchNews(url: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7") { articles in
                        for i in articles {
                            self.SaveNews(news: i)
                        }
                    }
                }
                
                self.LoadNews { articles in
                    print(articles.count)
                    completion(articles)
                }
                
            } else {
                self.LoadNews { articles in
                    print(articles.count)
                    completion(articles)
                }
            }
        }
    }
    
    func SaveNews(news: Article) {
        let newItem = NewsDB(context: context)
        
        newItem.title = news.title
        newItem.image = news.urlToImage
        newItem.url = news.url
        newItem.publishedAt = news.publishedAt
        
        do {
            try context.save()
            print(newItem)
        } catch {
            print(error)
        }
    }
    
    func DeleteNews(news: [NewsDB]) {
        
        for i in news {
            context.delete(i)
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func LoadNews(completion: @escaping([NewsDB])->()) {
        do {
            let news = try context.fetch(NewsDB.fetchRequest())
            completion(news)
        } catch {
            print(error)
        }
    }
}
