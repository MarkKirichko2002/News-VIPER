//
//  HomeDefaultRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

class HomeDefaultRouter {
    weak var presenter: HomePresenter?
    weak var viewController: UIViewController?
}

extension HomeDefaultRouter: HomeRouter {
    func getViewControllers()-> [UIViewController] {
        return [TopNewsModule().buildDefault(), NewsCategoriesModule().buildDefault()].map { UINavigationController(rootViewController: $0) }
    }
}
