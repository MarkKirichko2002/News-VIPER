//
//  HomeDefaultRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class HomeDefaultRouter {
    weak var presenter: HomePresenter?
    weak var viewController: UIViewController?
}

@available(iOS 13.0, *)
extension HomeDefaultRouter: HomeRouter {
    func getViewControllers()-> [UIViewController] {
        return [TopNewsModule().buildDefault(), NewsCategoriesModule().buildDefault(), SearchNewsModule().buildDefault()].map { UINavigationController(rootViewController: $0) }
    }
}
