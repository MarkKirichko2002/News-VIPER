//
//  SearchPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol SearchPresenter: AnyObject {
    var view: SearchView? {get set}
    var interactor: SearchInteractor? {get set}
    var router: SearchRouter? {get set}
    func interactorDidFetchedNews(news: [Article])
    func GoToWeb(url: String)
}
