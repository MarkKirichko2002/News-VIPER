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
    
    func GoToCurrentCategory(category: NewsCategory) {
        let vc = CurrentCategoryModule().buildDefault(category: category)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension NewsCategoriesRouter: CategoriesRouter {
    
}
