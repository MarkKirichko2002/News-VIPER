//
//  NewsCategoriesRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class NewsCategoriesRouter {
    
    weak var presenter: CategoriesPresenter?
    weak var viewController: UIViewController?
    
    @available(iOS 13.0, *)
    func GoToCurrentCategory(category: NewsCategory) {
        let vc = CurrentCategoryModule().buildDefault(category: category)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 13.0, *)
extension NewsCategoriesRouter: CategoriesRouter {
    
}
