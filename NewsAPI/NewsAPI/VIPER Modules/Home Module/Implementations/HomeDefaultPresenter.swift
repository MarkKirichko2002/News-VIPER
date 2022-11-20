//
//  HomeDefaultPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

class HomeDefaultPresenter {
    
    var router: HomeRouter?
    var interactor: HomeInteractor?
    weak var view: HomeView?
}

extension HomeDefaultPresenter: HomePresenter {
    func setupViewControllers() {
        guard let controllers = self.router?.getViewControllers() else {
            return
        }
        self.view?.display(controllers)
    }
}
