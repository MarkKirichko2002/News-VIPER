//
//  HomePresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

protocol HomePresenter: class {
    
    var router: HomeRouter? {get set}
    var interactor: HomeInteractor? {get set}
    var view: HomeView? {get set}
    
    func setupViewControllers()
    
}
