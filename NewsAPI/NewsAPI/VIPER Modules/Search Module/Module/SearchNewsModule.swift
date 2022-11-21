//
//  SearchNewsModule.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class SearchNewsModule {
    
    func buildDefault() -> UIViewController {
        let view = SearchNewsViewController()
        let interactor = SearchNewsInteractor()
        let presenter = SearchNewsPresenter()
        let router = SearchNewsRouter()

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
