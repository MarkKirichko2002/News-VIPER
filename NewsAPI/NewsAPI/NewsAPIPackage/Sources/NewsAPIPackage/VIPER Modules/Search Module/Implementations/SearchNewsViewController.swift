//
//  SearchNewsViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class SearchNewsViewController: UIViewController, UISearchControllerDelegate {
    
    var presenter: SearchPresenter?
    var news = [NewsViewModel]()
    var filterednews = [NewsViewModel]()
    var tableView = UITableView()
    var spinner = UIActivityIndicatorView(style: .large)
    let refreshControl = UIRefreshControl()
    lazy var searchBar:UISearchBar = UISearchBar()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Поиск"
        self.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func MicrophoneOn() {
        presenter?.isStart = !presenter!.isStart
        if presenter!.isStart {
            presenter?.MicrophoneButtonWasClicked()
        } else {
            presenter?.stopSpeechRecognition()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mic = UIBarButtonItem(image: UIImage(systemName: "mic"), style: .plain, target: self, action: #selector(MicrophoneOn))
        mic.tintColor = .black
        presenter?.barButtonItem = mic
        navigationItem.rightBarButtonItems = [mic]
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        filterednews = news
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Поиск..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.showsCancelButton = true
        self.tableView.keyboardDismissMode = .onDrag
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.rowHeight = 100
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinner.removeFromSuperview()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.async {
            self.presenter?.interactor?.GetNews()
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

@available(iOS 13.0, *)
extension SearchNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterednews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.configure(title: news[indexPath.row].title, image: news[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
               cell.didSelect(indexPath: indexPath)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.GoToWeb(url: self.news[indexPath.row].url)
        }
    }
}

@available(iOS 13.0, *)
extension SearchNewsViewController: SearchView {
    
    func displayNews(news: [NewsViewModel]) {
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
}

@available(iOS 13.0, *)
extension SearchNewsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterednews = []
        
        if searchText == "" {
            filterednews = news
        }
        
        for word in news {
            if word.title.uppercased().contains(searchText.uppercased()) {
                filterednews.append(word)
            }
        }
        
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        self.searchBar.endEditing(true)
        
    }
}
