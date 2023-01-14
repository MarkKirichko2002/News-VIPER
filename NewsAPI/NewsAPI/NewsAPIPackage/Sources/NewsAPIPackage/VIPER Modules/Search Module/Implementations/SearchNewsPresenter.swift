//
//  SearchNewsPresenter.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit
import Speech

@available(iOS 13.0, *)
class SearchNewsPresenter: SearchPresenter {
    
    var router: SearchRouter?
    weak var view: SearchView?
    var isStart: Bool = false
    weak var presenter: SearchPresenter?
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ru_RU"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var word = "главное"
    var newsArray = [NewsViewModel]()
    var barButtonItem: UIBarButtonItem?

    var interactor: SearchInteractor? {
        didSet {
            interactor?.GetNews()
        }
    }
    
    func MicrophoneButtonWasClicked() {
        self.configureAudioSession()
        self.StartSpeechRecognition()
    }
    
    func interactorDidFetchedNews(news: [Article]) {
        var newsArray = [NewsViewModel]()
        news.forEach { article in
            newsArray.append(NewsViewModel(title: article.title, image: article.urlToImage ?? "", url: article.url))
            view?.displayNews(news: newsArray)
        }
    }
    
    func configureAudioSession() {
        do {
            try? AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, policy: .default, options: .defaultToSpeaker)
        } catch {
            print(error)
        }
    }
    
    func StartSpeechRecognition() {
        let node = audioEngine.inputNode
        let recognitionFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recognitionFormat) {
            [unowned self](buffer, audioTime) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
            self.barButtonItem?.image = UIImage(systemName: "mic.fill")
        } catch let error {
            print("\(error.localizedDescription)")
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: {
            [unowned self] (result, error) in
            if let res = result?.bestTranscription {
                DispatchQueue.main.async {
                    self.word = res.formattedString
                    print(self.word)
                    self.checkVoiceCommands()
                }
                
            } else if let error = error {
                print("\(error.localizedDescription)")
            }
        })
    }
    
    
    func CheckWord(word: String)-> Bool {
        switch word {
            
        case _ where word.lowercased().contains("главн"):
            return true
            
        case _ where word.lowercased().contains("техно"):
            return true
            
        case _ where word.lowercased().contains("спорт"):
            return true
            
        case _ where word.lowercased().contains("бизнес"):
            return true
            
        case _ where word.lowercased().contains("развлеч"):
            return true
            
        case _ where word.lowercased().contains("случай"):
            return true
            
        default:
            return false
            
        }
    }
    
    func checkVoiceCommands() {
        let checkWord = CheckWord(word: self.word)
        if checkWord == true {
            stopSpeechRecognition()
            self.barButtonItem?.image = UIImage(systemName: "mic")
            reload()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.StartSpeechRecognition()
            }
        } else {}
    }
    
    func stopSpeechRecognition() {
        audioEngine.stop()
        recognitionTask?.cancel()
        request.endAudio()
        audioEngine.inputNode.removeTap(onBus: 0)
        self.newsArray.removeAll()
        self.barButtonItem?.image = UIImage(systemName: "mic")
    }
    
    func reload() {
        interactor?.GetCurrentVoiceCategoryNews(category: self.word, completion: { news in
            news.forEach { article in
                self.newsArray.append(NewsViewModel(title: article.title, image: article.urlToImage ?? "", url: article.url))
                self.view?.displayNews(news: self.newsArray)
            }
        })
    }
    
    func GoToWeb(url: String) {
        router?.GoToWeb(url: url)
    }
}
