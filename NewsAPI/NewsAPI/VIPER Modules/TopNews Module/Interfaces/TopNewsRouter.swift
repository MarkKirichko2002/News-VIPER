//
//  TopNewsRouter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

protocol TopNewsRouter {
    var presenter: TopNewsPresenter? { get set }
    func GoToWeb(url: String)
}
