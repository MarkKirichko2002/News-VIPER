//
//  CategoriesView.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol CategoriesView: AnyObject {
    var presenter: CategoriesPresenter?{get set}
}
