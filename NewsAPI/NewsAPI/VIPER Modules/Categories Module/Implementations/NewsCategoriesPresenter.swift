//
//  NewsCategoriesPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class NewsCategoriesPresenter {
    var view: CategoriesView?
       
    var interactor: CategoriesInteractor?
    
    var router: CategoriesRouter?
}

extension NewsCategoriesPresenter: CategoriesPresenter {
    
}
