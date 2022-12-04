//
//  BreakingNewsInteractor.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

@available(iOS 13.0, *)
class BreakingNewsInteractor {

    var apiManager = APIManager()
    var dbManager = DBManager()
    
    weak var presenter: TopNewsPresenter?
}

@available(iOS 13.0, *)
extension BreakingNewsInteractor: TopNewsInteractor {
    
    func GetTopNews() {
        apiManager.fetchNews(url: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=c6fb14909d524ae68ea631e5cb55ae67") { news in
            self.presenter?.interactorDidFetchedTopNews(news: news)
        }
    }
    
    func GetTopNewsFromDB() {
        dbManager.LoadData { news in
            self.presenter?.interactorDidFetchedTopNewsFromDB(news: news)
        }
    }
}
