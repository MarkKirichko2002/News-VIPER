//
//  CurrentNewsCategoryPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class CurrentNewsCategoryPresenter {
    
    weak var view: CurrentCategoryView?
    var interactor: CurrentCategoryInteractor?
    var router: CurrentCategoryRouter?
    let category: NewsCategory?
    
    var newsArray = [NewsViewModel]()
    
    init(category: NewsCategory) {
        self.category = category
    }
}

extension CurrentNewsCategoryPresenter: CurrentCategoryPresenter {
    
    func reload() {
        interactor?.GetCurrentCategoryNews(category: category!, completion: { news in
            news.forEach { article in
                self.newsArray.append(NewsViewModel(title: article.title, image: article.urlToImage ?? "", url: article.url))
                self.view?.displayCurrentCategoryNews(news: self.newsArray)
            }
        })
    }
    
    func GoToWeb(url: String) {
        router?.GoToWeb(url: url)
    }
}
