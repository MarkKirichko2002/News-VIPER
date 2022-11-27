//
//  SearchNewsInteractor.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class SearchNewsInteractor {

    var apiManager = APIManager()
    
    weak var presenter: SearchPresenter?
}

extension SearchNewsInteractor: SearchInteractor {
    
    func GetNews() {
        apiManager.fetchNews(url: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7") { news in
            self.presenter?.interactorDidFetchedNews(news: news)
        }
    }
}
