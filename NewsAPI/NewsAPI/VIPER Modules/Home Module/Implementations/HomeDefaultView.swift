//
//  HomeDefaultView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

class HomeDefaultView: UITabBarController {
    
    var presenter: HomePresenter?
    
}

extension HomeDefaultView: HomeView {
    
    func display(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
}
