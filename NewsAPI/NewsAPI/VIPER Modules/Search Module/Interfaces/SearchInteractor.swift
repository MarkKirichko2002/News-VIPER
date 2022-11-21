//
//  SearchInteractor.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation

protocol SearchInteractor {
    var presenter: SearchPresenter? {get set}
    func GetNews()
}
