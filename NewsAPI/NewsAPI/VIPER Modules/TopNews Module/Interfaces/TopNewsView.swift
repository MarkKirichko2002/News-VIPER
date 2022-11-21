//
//  TopNewsView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

protocol TopNewsView: class {
    var presenter: TopNewsPresenter? { get set }
    func displayTopNews(news: [NewsViewModel])
}

