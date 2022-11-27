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
    var animation = AnimationClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .black
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animation.TabBarItemAnimation(item: item)
    }
    
}

extension HomeDefaultView: HomeView {
    
    func display(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
}
