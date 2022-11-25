//
//  TopNewsPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

protocol TopNewsPresenter: AnyObject {
    var router: TopNewsRouter? { get set }
    var interactor: TopNewsInteractor? { get set }
    var view: TopNewsView? { get set }
    func interactorDidFetchedTopNews(news: [Article])
    func interactorDidFetchedTopNewsFromDB(news: [NewsDB])
    func LoadFromDB() 
    func GoToWeb(url: String)
}
