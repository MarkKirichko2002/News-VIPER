//
//  CurrentNewsCategoryRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class CurrentNewsCategoryRouter {
    weak var presenter: CurrentCategoryPresenter?
    weak var viewController: UIViewController?
}

@available(iOS 13.0, *)
extension CurrentNewsCategoryRouter: CurrentCategoryRouter {
    func GoToWeb(url: String) {
        let vc = URLViewController()
        vc.url = url
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
