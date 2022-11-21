//
//  NewsCategoriesPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class NewsCategoriesPresenter {
    
    var router: CategoriesRouter?
    
    var view: CategoriesView?
       
    var interactor: CategoriesInteractor? 
}

extension NewsCategoriesPresenter: CategoriesPresenter {
    
    func didInteractorFetchedCategories(categories: [NewsCategory]) {
        view?.displayCategories(categories: categories)
    }
}
