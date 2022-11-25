//
//  TopNewsModule.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

class TopNewsModule {

    @available(iOS 13.0, *)
    func buildDefault() -> UIViewController {
        let view = BreakingNewsView()
        let interactor = BreakingNewsInteractor()
        let presenter = BreakingNewsPresenter()
        let router = BreakingNewsRouter()

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
