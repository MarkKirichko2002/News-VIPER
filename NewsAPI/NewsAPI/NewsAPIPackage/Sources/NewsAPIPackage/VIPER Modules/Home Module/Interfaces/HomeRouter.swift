//
//  HomeRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

protocol HomeRouter {

    var presenter: HomePresenter? {get set}
    
    func getViewControllers()->[UIViewController]
    
}

