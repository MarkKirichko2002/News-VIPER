//
//  CurrentCategoryPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CurrentCategoryPresenter:AnyObject {
    var view: CurrentCategoryView?{get set}
    var interactor: CurrentCategoryInteractor?{get set}
    var router: CurrentCategoryRouter?{get set}
    func GoToWeb(url: String)
    func reload()
}
