//
//  SearchNewsInteractor.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import Speech

class SearchNewsInteractor {

    var url = ""
    var articles = [Article]()
    var presenter: SearchPresenter?
    var apiManager = APIManager()
}

extension SearchNewsInteractor: SearchInteractor {
    
    func GetCurrentVoiceCategoryNews(category: String, completion: @escaping([Article])->()) {
        url = apiManager.RecognizeCurrentCategory(category: category)
        apiManager.fetchNews(url: url) { articles in
            self.articles = articles
            completion(self.articles)
        }
    }
    
    func GetNews() {
        apiManager.fetchNews(url: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7") { news in
            self.presenter?.interactorDidFetchedNews(news: news)
        }
    }
}
