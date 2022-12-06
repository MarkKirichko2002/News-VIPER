//
//  SearchPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

protocol SearchPresenter: AnyObject {
    var view: SearchView? {get set}
    var interactor: SearchInteractor? {get set}
    var router: SearchRouter? {get set}
    var isStart: Bool {get set}
    var barButtonItem: UIBarButtonItem? {get set}
    func interactorDidFetchedNews(news: [Article])
    func interactorDidFetchedRandomNews(news: [Article])
    func MicrophoneButtonWasClicked()
    func DiceButtonWasClicked()
    func StartSpeechRecognition()
    func stopSpeechRecognition()
    func GoToWeb(url: String)
    func reload()
}
