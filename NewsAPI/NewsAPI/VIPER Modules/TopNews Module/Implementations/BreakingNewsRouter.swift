//
//  BreakingNewsRouter.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

class BreakingNewsRouter {

    weak var presenter: TopNewsPresenter?
    weak var viewController: UIViewController?
}

extension BreakingNewsRouter: TopNewsRouter {
    func GoToWeb(url: String) {
        let vc = URLViewController()
        vc.url = url
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
