//
//  CurrentCategoryRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CurrentCategoryRouter {
    var presenter: CurrentCategoryPresenter?{get set}
    func GoToWeb(url: String)
}
