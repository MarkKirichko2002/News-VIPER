//
//  CategoriesPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CategoriesPresenter:class {
    var view: CategoriesView?{get set}
    var interactor: CategoriesInteractor? {get set}
    var router: CategoriesRouter? {get set}
}
