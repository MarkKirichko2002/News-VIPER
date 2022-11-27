//
//  SearchNewsPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class SearchNewsPresenter: SearchPresenter {
    
    var router: SearchRouter?
    
    weak var view: SearchView?
    
    var interactor: SearchInteractor? {
        didSet {
            interactor?.GetNews()
        }
    }
    
    func interactorDidFetchedNews(news: [Article]) {
        var newsArray = [NewsViewModel]()
            news.forEach { article in
                newsArray.append(NewsViewModel(title: article.title, image: article.urlToImage ?? "", url: article.url))
            view?.displayNews(news: newsArray)
        }
    }
    
    func GoToWeb(url: String) {
        router?.GoToWeb(url: url)
    }
}
