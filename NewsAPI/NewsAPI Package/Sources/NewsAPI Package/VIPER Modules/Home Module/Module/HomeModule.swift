//
//  HomeModule.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

class HomeModule {
    
    func buildDefault() -> UIViewController {
        let view = HomeDefaultView()
        let interactor = HomeDefaultInteractor()
        let presenter = HomeDefaultPresenter()
        let router = HomeDefaultRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view

        presenter.setupViewControllers()
        
        return view
    }
    
}
