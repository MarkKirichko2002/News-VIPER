//
//  SearchRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol SearchRouter {
    var presenter: SearchPresenter? {get set}
    func GoToWeb(url: String)
}
