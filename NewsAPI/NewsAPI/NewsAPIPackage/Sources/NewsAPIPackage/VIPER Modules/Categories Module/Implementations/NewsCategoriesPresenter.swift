//
//  NewsCategoriesPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

class NewsCategoriesPresenter {
    
    var router: CategoriesRouter?
    
    weak var view: CategoriesView?
       
    var interactor: CategoriesInteractor?
    
    var player = SoundClass()
    
}

extension NewsCategoriesPresenter: CategoriesPresenter {
    
    func GoToCurrentCategory(category: NewsCategory) {
        player.PlaySound(resource: category.sound)
        router?.GoToCurrentCategory(category: category)
    }
}
