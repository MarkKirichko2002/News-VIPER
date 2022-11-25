//
//  BreakingNewsPresenter.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

class BreakingNewsPresenter: TopNewsPresenter {
    
    var router: TopNewsRouter?
    
    var view: TopNewsView?
    
    var interactor: TopNewsInteractor? {
        didSet {
            interactor?.GetTopNews()
        }
    }
    
    func LoadFromDB() {
        interactor?.GetTopNewsFromDB()
    }
    
    func interactorDidFetchedTopNews(news: [Article]) {
        var newsArray = [NewsViewModel]()
        news.forEach { article in
            newsArray.append(NewsViewModel(title: article.title, image: article.urlToImage ?? "", url: article.url))
            view?.displayTopNews(news: newsArray)
        }
    }
    
    func interactorDidFetchedTopNewsFromDB(news: [NewsDB]) {
        view?.displayTopNewsFromDB(news: news)
    }
    
    
    func GoToWeb(url: String) {
        router?.GoToWeb(url: url)
    }
}
