//
//  BreakingNewsInteractor.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

class BreakingNewsInteractor {

    var apiManager = APIManager()
    
    weak var presenter: TopNewsPresenter?
}

extension BreakingNewsInteractor: TopNewsInteractor {
    
    func GetTopNews() {
        apiManager.fetchNews(url: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=0532857d0c9949ab8d5979e5153377b7") { news in
            self.presenter?.interactorDidFetchedTopNews(news: news)
        }
    }
}
