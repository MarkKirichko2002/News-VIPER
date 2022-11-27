//
//  CategoriesRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CategoriesRouter {
    var presenter: CategoriesPresenter? {get set}
    func GoToCurrentCategory(category: NewsCategory)
}
