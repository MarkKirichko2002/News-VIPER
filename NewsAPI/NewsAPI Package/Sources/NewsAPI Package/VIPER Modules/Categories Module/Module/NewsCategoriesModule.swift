//
//  NewsCategoriesModule.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class NewsCategoriesModule {
    
    @available(iOS 13.0, *)
    func buildDefault() -> UIViewController {
        let view = NewsCategoriesTableViewController()
        let interactor = NewsCategoriesInteractor()
        let presenter = NewsCategoriesPresenter()
        let router = NewsCategoriesRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}
