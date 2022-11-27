//
//  HomeModule.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
public class HomeModule {
    
    public init() {}
    
    public func buildDefault() -> UIViewController {
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
