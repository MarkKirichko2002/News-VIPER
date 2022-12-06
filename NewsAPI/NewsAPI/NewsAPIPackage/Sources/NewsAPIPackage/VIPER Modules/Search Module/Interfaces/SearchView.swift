//
//  SearchView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol SearchView: AnyObject {
    var presenter: SearchPresenter? {get set}
    func displayNews(news:[NewsViewModel])
    func displayRandomNews(news: [NewsViewModel])
}
