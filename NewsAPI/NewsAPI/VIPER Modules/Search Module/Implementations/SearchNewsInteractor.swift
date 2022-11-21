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
        apiManager.fetchNews { news in
            self.presenter?.interactorDidFetchedNews(news: news)
        }
    }
}
