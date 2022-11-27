//
//  TopNewsView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

protocol TopNewsView: AnyObject {
    var presenter: TopNewsPresenter? { get set }
    func displayTopNews(news: [NewsViewModel])
    func displayTopNewsFromDB(news: [NewsDB])
}

