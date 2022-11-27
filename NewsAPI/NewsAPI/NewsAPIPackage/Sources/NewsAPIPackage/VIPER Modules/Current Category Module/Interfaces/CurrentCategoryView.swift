//
//  CurrentCategoryView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CurrentCategoryView:AnyObject {
    var presenter: CurrentCategoryPresenter? {get set}
    func displayCurrentCategoryNews(news:[NewsViewModel])
}
