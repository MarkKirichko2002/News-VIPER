//
//  SearchNewsRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class SearchNewsRouter {

    weak var presenter: SearchPresenter?
    weak var viewController: UIViewController?

}

@available(iOS 13.0, *)
extension SearchNewsRouter: SearchRouter {
    func GoToWeb(url: String) {
        let vc = URLViewController()
        vc.url = url
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
