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
        apiManager.fetchNews { news in
            self.presenter?.interactorDidFetchedTopNews(news: news)
        }
    }
}
