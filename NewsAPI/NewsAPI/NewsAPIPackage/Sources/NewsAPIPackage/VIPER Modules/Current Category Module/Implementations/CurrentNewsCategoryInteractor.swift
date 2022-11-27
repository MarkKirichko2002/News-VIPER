//
//  CurrentNewsCategoryInteractor.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class CurrentNewsCategoryInteractor {
    
    var apiManager = APIManager()
    
    var url = ""
    
    weak var presenter: CurrentCategoryPresenter?
    
    var articles = [Article]()
    
}

extension CurrentNewsCategoryInteractor: CurrentCategoryInteractor {
    
    func GetCurrentCategoryNews(category: NewsCategory, completion: @escaping([Article])->()) {
        url = apiManager.CurrentCategory(id: category.id)
        apiManager.fetchNews(url: url) { articles in
            self.articles = articles
            completion(self.articles)
        }
    }
}
