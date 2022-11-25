//
//  CurrentCategoryInteractor.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CurrentCategoryInteractor {
    var presenter: CurrentCategoryPresenter? {get set}
    func GetCurrentCategoryNews(category: NewsCategory, completion: @escaping([Article])->())
}
