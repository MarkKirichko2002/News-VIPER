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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .black
    }
}

extension HomeDefaultView: HomeView {
    
    func display(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
}
