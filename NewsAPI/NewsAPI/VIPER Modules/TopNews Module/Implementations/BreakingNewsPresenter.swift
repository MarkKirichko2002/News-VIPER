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
    
    func interactorDidFetchedTopNews(news: [Article]) {
        var newsArray = [NewsViewModel]()
            news.forEach { article in
                newsArray.append(NewsViewModel(title: article.title, description: article.articleDescription ?? "", image: article.urlToImage ?? ""))
            view?.displayTopNews(news: newsArray)
        }
    }
}
