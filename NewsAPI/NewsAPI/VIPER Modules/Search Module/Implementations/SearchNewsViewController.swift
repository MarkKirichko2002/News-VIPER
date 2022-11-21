//
//  SearchNewsViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class SearchNewsViewController: UIViewController, UISearchControllerDelegate {
    
    var presenter: SearchPresenter?
    var news = [NewsViewModel]()
    var filterednews = [NewsViewModel]()
    var tableView = UITableView()
    var spinner = UIActivityIndicatorView(style: .large)
    lazy var searchBar:UISearchBar = UISearchBar()
   
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Поиск"
        self.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterednews = news
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Поиск..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
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
}


extension SearchNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterednews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.configure(news: filterednews[indexPath.row])
        return cell
    }
}


extension SearchNewsViewController: SearchView {
    
    func displayNews(news: [NewsViewModel]) {
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
}

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
}
