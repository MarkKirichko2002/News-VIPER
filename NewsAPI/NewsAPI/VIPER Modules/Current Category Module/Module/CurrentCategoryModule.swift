//
//  CurrentCategoryModule.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class CurrentCategoryModule {
    
    func buildDefault(category: NewsCategory) -> UIViewController {
        let view = CurrentCategoryNewsTableViewController()
        let interactor = CurrentNewsCategoryInteractor()
        let presenter = CurrentNewsCategoryPresenter(category: category)
        let router = CurrentNewsCategoryRouter()

        view.presenter = presenter
        view.category = category

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view
        
        return view
    }
}
