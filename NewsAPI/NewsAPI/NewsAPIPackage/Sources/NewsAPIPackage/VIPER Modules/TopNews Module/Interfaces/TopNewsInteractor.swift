//
//  TopNewsInteractor.swift
//  NewsAPI
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation

protocol TopNewsInteractor {
    var presenter: TopNewsPresenter? { get set }
    func GetTopNews()
    func GetTopNewsFromDB()
}
