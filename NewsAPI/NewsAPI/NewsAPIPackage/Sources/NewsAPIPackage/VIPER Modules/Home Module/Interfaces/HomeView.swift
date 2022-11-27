//
//  HomeView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresenter? {get set}
    func display(_ viewControllers: [UIViewController])
}
