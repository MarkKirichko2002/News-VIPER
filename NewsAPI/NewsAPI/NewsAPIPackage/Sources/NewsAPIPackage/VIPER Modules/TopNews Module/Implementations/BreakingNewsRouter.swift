//
//  BreakingNewsRouter.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class BreakingNewsRouter {

    weak var presenter: TopNewsPresenter?
    weak var viewController: UIViewController?
}

@available(iOS 13.0, *)
extension BreakingNewsRouter: TopNewsRouter {
    func GoToWeb(url: String) {
        let vc = URLViewController()
        vc.url = url
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
